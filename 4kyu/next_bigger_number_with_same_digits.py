def biggest(n):
    t = n
    arr = []
    while t > 0:
        arr.append(t%10)
        t //= 10
        arr = sorted(arr, reverse=True)
        b = 0
    for i in arr:
        b = b * 10 + i
    return b

def next_bigger(n):
    b = biggest(n)
    if n == b:
        return -1
    n += 1
    while b != biggest(n):
        n += 1
    return n
