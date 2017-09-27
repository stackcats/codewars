lst = [[0]]
for i in range(2722):
    T=[d*10**i+x for x in lst[-1] for d in range(10)]
    lst.append([x for x in T if x**2 % 10**(i+1) == x])
res = list(set(sum(lst, [])))
res.sort()

def green(n) :
    global res
    return res[n]
