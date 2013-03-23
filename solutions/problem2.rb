sum = 0

fib0 = 1
fib1 = 1
fib2 = 2

until fib2 > 4000000
  
  if fib2 % 2 == 0
    sum += fib2
  end
  
  fib0 = fib1
  fib1 = fib2
  fib2 = fib0 + fib1
  
end

puts sum
