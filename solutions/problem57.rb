def nth_approx(n)
  num = 2.to_r
  n.times do
    num = 2 + 1/num
  end
  num - 1
end

count = 0
for n in 1..1000
  approx = nth_approx(n)
  if approx.numerator.to_s.size > approx.denominator.to_s.size
    count += 1
  end
end

puts count
