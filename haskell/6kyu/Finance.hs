module Codewars.Kata.Finance where

finance :: Integer -> Integer
finance n = go 0 n (n + 1)
 where
  go _ _ 0 = 0
  go a b x = (a + b) * x `div` 2 + go (a + 2) (b + 1) (x - 1)
