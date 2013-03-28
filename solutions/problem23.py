import math

def proper_factors(n):
    root = math.sqrt(n)
    floor = int(root)
    
    factors = []
    factors.append(1)

    for i in range(2, floor+1):
        if i == root:
            factors.append(i)
        elif n % i == 0:
            factors.extend([i, n/i])

    return factors

def is_abundant(n):
    return n < sum(proper_factors(n))

abundants = [n for n in range(2,28124) if is_abundant(n)]

sums = [False]*28124
for a in abundants:
    for b in abundants:
        n = a+b
        if a+b > 28123:
            break;
        sums[n] = True
print sum([i for i, n in enumerate(sums) if not n])
