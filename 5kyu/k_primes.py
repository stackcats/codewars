def factor(n):
    ct = 0
    i = 2
    while i * i <= n:
        while n % i == 0:
            ct += 1
            n /= i
        i += 1

    if n > 1:
        ct += 1

    return ct
    
def count_Kprimes(k, start, nd):
    lst = []
    for i in range(start, nd + 1):
        if k == factor(i):
            lst.append(i)

    return lst

def puzzle(s):
    p1 = count_Kprimes(1, 0, s)
    p3 = count_Kprimes(3, 0, s)
    p7 = count_Kprimes(7, 0, s)

    ct = 0
    for x1 in p1:
        for x3 in p3:
            for x7 in p7:
                if x1 + x3 + x7 == s:
                    ct += 1

    return ct
