max_sum = 0
max_num = 0

for a in 1..99
  for b in 1..99
    num = a ** b
    sum = num.to_s.chars.map{ |i| i.to_i }.reduce(:+)
    if sum > max_sum
      max_sum = sum
      max_num = num
    end
  end
end

puts max_sum
