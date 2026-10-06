module FizzBuzz where

fizzbuzz :: Int -> [Int]
fizzbuzz n = [a, b, c]
 where
  a = sum [1 | i <- [3, 6 .. n - 1], i `rem` 5 /= 0]
  b = sum [1 | i <- [5, 10 .. n - 1], i `rem` 3 /= 0]
  c = sum [1 | i <- [15, 30 .. n - 1], i `rem` 15 == 0]
