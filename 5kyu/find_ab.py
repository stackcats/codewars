from collections import defaultdict


def find_ab(ns, c):
    if len(ns) < 2:
        return None

    if c == 0:
        return find0(ns)

    mp = defaultdict(int)
    for n in ns:
        if n == 0 or c % n != 0:
            continue
        mp[n] += 1

    for n in ns:
        if n == 0 or c % n != 0:
            continue
        m = c // n
        if m == n:
            if mp[n] > 1:
                return [n, n]
        elif m in mp:
            return [n, m]


def find0(ns):
    if 0 not in ns:
        return None
    i = ns.index(0)
    if i == 0:
        return [0, ns[1]]
    return [ns[0], 0]
