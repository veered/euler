keylog = "319 680 180 690 129 620 762 689 762 318 368 710 720 710 629 168 160 689 716 731 736 729 316 729 729 710 769 290 719 680 318 389 162 289 162 718 729 319 790 680 890 362 319 760 316 729 380 319 728 716"
keylog = keylog.split.map{ |n| n.chars.map{ |c| c.to_i } }

def constrained?(pass, constraint)
  for i in 0...pass.size
    next unless pass[i] == constraint[0]
    for j in i+1...pass.size
      next unless pass[j] == constraint[1]
      for k in j+1...pass.size
        return true if pass[k] == constraint[2]
      end
    end
  end
  return false
end

for n in 3...Float::INFINITY
  [*0..9].repeated_permutation(n).each do |pass|
     if keylog.all? { |c| constrained?(pass, c) }
       puts pass
       exit
     end
  end
end