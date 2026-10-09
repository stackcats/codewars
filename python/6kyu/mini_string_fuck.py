def my_first_interpreter(code):
    n = 0
    ans = ''
    for cmd in code:
        if cmd == '+':
            n += 1
            n %= 256
        elif cmd == '.':
            ans += chr(n)
    return ans
