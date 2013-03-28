
fib0 = 1
fib1 = 1
fib2 = 0
i = 2
while True:
    fib2 = fib0 + fib1
    fib0 = fib1
    fib1 = fib2
    i += 1

    if len(str(fib2)) == 1000:
        print i
        exit()
