module Codewars.G964.Seven where

seven :: Integer -> (Integer, Int)
seven 0 = (0, 0)
seven m = f m 1

f :: Integer -> Int -> (Integer, Int)
f m ct
  | n < 100 = (n, ct)
  | otherwise = f n (ct + 1)
 where
  (a, b) = m `divMod` 10
  n = a - 2 * b
