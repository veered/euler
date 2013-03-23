def prime?(n, primes)
  root = Math.sqrt(n).floor

  primes.each do |p|
    break if p > root
    return false if n % p == 0
  end

  true
end

def nprimes(n)
  primes = []
  for i in 2..n
    primes << i if prime?(i, primes)
  end
  primes
end

puts nprimes(2000000).reduce :+
