module Fibonacci where

fib :: Int -> Integer
fib n = (\(a, _, _) -> a) $ until (\(a, b, m) -> m == n) (\(a, b, m) -> (b, a + b, m + 1)) (0, 1, 1)
