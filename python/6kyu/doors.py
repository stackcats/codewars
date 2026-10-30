def doors(n):
    i = 1
    ct = 0
    while i * i <= n:
        ct += 1
        i += 1
    return ct
