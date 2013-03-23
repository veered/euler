def gcd(a, b)
  if a < b
    return gcd(b, a)
  end
  
  mod = a % b
  if (mod == 0)
    return b
  else
    return gcd(b, mod)
  end
  
end

def lcm(a,b)
  a * b / gcd(a,b)
end

puts (1..20).to_a.reduce :lcm
