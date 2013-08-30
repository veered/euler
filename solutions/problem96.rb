require 'colored'

def constraints(puzzle, index)
  r = row(puzzle, index)
  c = col(puzzle, index)
  b = block(puzzle, index)

  (1..9).select do |i|
    not r.include? i and
        not c.include? i and
        not b.include? i
  end
end

def parse_puzzle(str)
  str.chars.map { |i| i.to_i }
end

def row(puzzle, index)
  r = index / 9
  puzzle[r*9...r*9+9]
end

def col(puzzle, index)
  c = index % 9
  puzzle.values_at(*(0...9).map { |i| i*9 + c })
end

def block(puzzle, index)
  r = index / 9
  r = r - (r % 3)

  c = index % 9
  c = c - (c % 3)

  tr = r * 9 + c
  puzzle.values_at(*[tr, tr + 1, tr + 2, tr + 9, tr + 10, tr + 11, tr + 18, tr + 19, tr + 20])
end

def print_puzzle(puzzle, emph = [])
  print "\n" + "-".blue * 25 + "\n"
  puzzle.each_with_index do |n, i|
    print "| ".blue if i % 3 == 0

    if emph.include? i
      print "#{n} ".red
    elsif n == 0
      print "#{n} ".yellow
    else
      print "#{n} "
    end

      print "|".blue if i % 9 == 8

    puts if i % 9 == 8
    print "-".blue * 25 + "\n" if i % 9 == 8 and i/9 % 3 == 2
  end

  puts
end

str = "003020600900305001001806400008102900700000008006708200002609500800203009005010300"
# str = "200080300060070084030500209000105408000000000402706000301007040720040060004010003"
# str = "300200000000107000706030500070009080900020004010800050009040301000702000000008006"
# str = "004000000000030002390700080400009001209801307600200008010008053900040000000000800"
# str = "608070502050608070002000300500090006040302050800050003005000200010704090409060701"
puzzle = parse_puzzle(str)

$count = 0
def solve(puzzle, depth = 2)
  bf = 1
  while puzzle.include? 0

    progress = false
    puzzle.each_with_index do |n, i|
      next unless n == 0
      cons = constraints(puzzle, i)

      if cons.size == 0
        $count += 1
        puts $count

        return false
      elsif cons.size == 1
        puzzle[i] = cons.first
        progress = true
      elsif cons.size <= bf
        cons.each do |c|
          branch = puzzle.clone
          branch[i] = c
          solution = solve(branch, depth - 1)
          return solution if solution
        end
      end
    end

    unless progress
      unless depth <=  0
        bf += 1
        depth -= 1
      else
        return false
      end
    end

  end

  return puzzle
end

def solve_bfs(puzzle)
  bf = 1
  while puzzle.include? 0

    progress = false
    puzzle.each_with_index do |n, i|
      next unless n == 0
      cons = constraints(puzzle, i)

      if cons.size == 0
        $count += 1
        puts $count

        return false
      elsif cons.size == 1
        puzzle[i] = cons.first
        progress = true
      elsif cons.size <= bf
        cons.each do |c|
          branch = puzzle.clone
          branch[i] = c
          solution = solve(branch, depth - 1)
          return solution if solution
        end
      end
    end

    unless progress
      unless depth == 0
        bf += 1
      else
        return false
      end
    end

  end

  return puzzle
end

print_puzzle(puzzle)
for depth in 1..Float::INFINITY
  solution = solve(puzzle, depth)
  next if solution
end
print_puzzle(solution) if solution