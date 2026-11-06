module Fib where

fib :: Int -> Integer
fib = go 0 1
 where
  go x y ct
    | ct == 1 = x
    | otherwise = go y (x + y) (ct - 1)
