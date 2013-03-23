def prime?(n, primes)
  root = Math.sqrt(n).floor

  primes.each do |p|
    break if p > root
    return false if n % p == 0
  end

  true
end

def nth_prime(n)
  primes = []
  for i in 2..Float::INFINITY
    primes << i if prime?(i, primes)
    break if primes.count == n
  end
  primes.last
end

puts nth_prime(10001)
