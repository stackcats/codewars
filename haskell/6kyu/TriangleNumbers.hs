module Codewars.Kata.TriangleNumbers where

isTriangleNumber :: Integer -> Bool
isTriangleNumber n = m * (m + 1) `div` 2 == n
 where
  m = floor . sqrt $ fromIntegral (n * 2)
