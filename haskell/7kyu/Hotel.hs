module Hotel where

groupSize :: Integer -> Integer -> Integer
groupSize s d = s + (n - 1)
 where
  a = 2 * (fromIntegral s) - 1
  n = ceiling $ (sqrt (a ^ 2 + 8 * (fromIntegral d)) - a) / 2
