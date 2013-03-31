def convert(n)
  n.to_s.split(//).map{ |d| d.to_i**5 }.reduce(:+)
end

sum = 0
for n in 1000..999999
  if n == convert(n)
    sum += n
  end
end

puts sum
