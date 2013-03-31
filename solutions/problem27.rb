
def num_primes(a, b, primes)
  for n in 0..Float::INFINITY
    value = n**2 + a*n + b
    return n unless prime?(value, primes)
  end
end

def prime?(n, primes)
  primes = find_primes(n, primes)
  primes.include? n
end

def find_primes(n, primes)
  return primes if n <= (primes.last or 0)
  
  start = (primes.empty?) ? 2 : (primes.last + 1)
  composite = (start..n).to_a

  for p in primes
    composite.keep_if { |c| c % p != 0 }
  end
  
  until composite.empty?
    primes << composite.first
    composite.keep_if { |c| c % primes.last != 0 }
  end
  
  primes
end

best = [0, 0, 0]
primes = find_primes(1000, [])

for b in primes.clone
  next if b < 41
  
  for a in -1000...1000
    next if a + b < 0 
    
    count = num_primes(a, b, primes)
    if count > best[0]
      best = [count, a, b]
      # puts "(#{a}, #{b}) -> #{count}"
    end
    
  end
  
end

puts best[1] * best[2] 
