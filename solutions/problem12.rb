def num_factors(n)
  root = Math.sqrt(n)
  froot = root.floor

  num = 0
  for i in 1..froot
    num += 1 if n % i == 0
  end
  num *= 2
  num += 1 if root == froot
  
  num
end

n = 0
for i in 1..Float::INFINITY
  n += i
  factors = num_factors(n)

  if factors > 500
    puts n
    exit
  end
  
end
