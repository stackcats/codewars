module Binary (trailingZeros) where

trailingZeros :: Int -> Int
trailingZeros n
  | n == 0 = 0
  | even n = 1 + m
  | otherwise = 0
 where
  m = trailingZeros $ n `div` 2
