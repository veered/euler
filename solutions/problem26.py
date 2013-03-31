import math

def gcd(numbers):
    return reduce(gcd2, numbers)
    
# Euclid's Algorithm
def gcd2(a,b):
    if a < b:
        return gcd2(b, a)

    mod = a % b
    if mod == 0:
        return b
    else:
        return gcd2(b, mod)

def lcm(numbers):
    if len(numbers) == 1:
        return numbers[0]
    return reduce(lambda a,b: a*b, numbers) / gcd(numbers)

def prime_factors(n, primes):
    factors = []
    for p in primes:
        
        k = 0
        while n % p == 0:
            k += 1
            n = n/p
            
        if k != 0:
            factors.append((p, k))

        if n == 1:
            break

    return factors

# Sieve of Eratosthenes
def find_primes(n):
    composite = range(2, n)
    primes = []

    
    while len(composite) != 0:
        primes.append(composite[0])
        composite = [c for c in composite if c % primes[-1] != 0]

    return primes
        
# Calculate the multiplicative order of n (mod p)
def order(n, p):
    n = n % p
    
    if p == 2 or n == 0:
        return 1

    value = n
    k = 1
    
    while value != 1:
       value = n * value % p 
       k += 1

    return k

def period(n, primes, orders):
    factors = prime_factors(n, primes)
    for (i, (p, k)) in enumerate(factors):
        if p in [2, 5]:
            factors[i] = (p, 1)
        if p in [3, 487, 56598313]:
           factors[i] = (p, 1) if k == 1 else (p, k-1) 
    
    periods = [ pow(p, k-1) * orders[p] for (p, k) in factors]
    return lcm(periods)

n = 1000
primes = find_primes(n)

orders = {}
for p in primes:
    orders[p] = order(10, p)

periods = {}
for i in range(2,n):
    periods[i] = period(i, primes, orders)

print max(periods, key=periods.get)
