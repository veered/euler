sum = 1
current = 1
for i in 1..500
  delta = 2 * i
  4.times do 
    current += delta
    sum += current
  end
end

puts sum
