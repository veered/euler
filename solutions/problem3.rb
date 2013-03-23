num = 600851475143

def prime?(n, primes)
  root = Math.sqrt(n).floor

  primes.each do |p|
    break if p > root
    return false if n % p == 0
  end

  true
end

def get_primes(n)
  root = Math.sqrt(n).floor
  
  primes = []
  for i in 2..root
    primes << i if prime?(i, primes)
  end

  primes
end

factors = get_primes(num).select { |p| num % p == 0 }
puts factors.max
