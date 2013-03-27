def factor(n)
  root = Math.sqrt(n)
  root_floor = root.floor
  factors = []

  factors << 1
  factors << root if root == root_floor
  
  for i in 2...root_floor
    if n % i == 0
      factors << i
      factors << n/i
    end
  end
  
  factors
end

sums = {}
for n in 2...10000
  sums[n] = factor(n).reduce(:+)
end

amicable = []
for n in 2...10000
  amicable << n if n == sums[sums[n]] and n != sums[n] 
end

puts amicable.reduce(:+)
