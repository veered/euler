def factorial(n)
  return 1 if n == 1
  n * factorial(n-1)
end

puts factorial(100).to_s.chars.map(&:to_i).reduce(:+)
