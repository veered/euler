
def collatz(n, cache)
  return cache[n] unless cache[n].nil?

  if n.even?
    cache[n] = collatz(n/2, cache) + 1
  else
    cache[n] = collatz(3*n + 1, cache) + 1
  end
  
end

max = 1
cache = { 1 => 1 }
for n in 1...1000000
  chain = collatz(n, cache)
  max = chain > cache[max] ? n : max
end

puts max
