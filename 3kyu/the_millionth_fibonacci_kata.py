# from https://en.wikipedia.org/wiki/Fibonacci_number
# F(2n) = F(n) * (2 * F(n-1) + F(n))
# F(2n-1) = F(n)^2 + F(n-1)^2
# F(-n) = -1^(n+1) * F(n) (n < 0)
mem = {0: 0L, 1: 1L}
def fib(n):
  if n in mem: 
    return mem[n]
  if n < 0:
      mem[n] = int(-1 ** (n+1) * fib(-n)) 
  if n % 2 == 0:
      mem[n] = fib(n/2) * (2 * fib(n/2-1) + fib(n/2))
      return mem[n]
  else:
      mem[n] = fib((n+1)/2) ** 2 + fib((n-1)/2) ** 2
      return mem[n]

