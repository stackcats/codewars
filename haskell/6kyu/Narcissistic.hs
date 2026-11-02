module Narcissistic where

narcissistic :: (Integral n) => n -> Bool
narcissistic 0 = True
narcissistic n = (sum $ map (^ l) xs) == n
 where
  xs = digits n
  l = length xs

digits n
  | n == 0 = []
  | otherwise = (n `mod` 10) : digits (n `div` 10)
