max = 0
for i in 1..999
  for j in 1..999
    prod = i*j
    if prod.to_s == prod.to_s.reverse and prod > max
      max = prod
    end
  end
end

puts max
