from functools import cache


@cache
def cut(number, target):
    n = int(number)

    if n <= target:
        return n

    ans = -1
    for i in range(1, len(number)):
        l = cut(number[:i], target)
        r = cut(number[i:], target - l)
        if l > -1 and r > -1 and l + r <= target:
            ans = max(ans, l + r)
    return ans
