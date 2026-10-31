module Codewars.MersennePrimes where

validMersenne :: Int -> Bool
validMersenne n
  | n < 2 = False
  | n == 2 = True
  | otherwise = foldl (\s _ -> (s * s - 2) `mod` m) 4 [1 .. (n - 2)] == 0
 where
  m = 2 ^ n - 1
