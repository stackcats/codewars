module SequenceSum where

sumOfN :: Int -> [Int]
sumOfN n = take len [p * i * n `div` 2 | (i, n) <- zip [0 ..] [1 ..]]
 where
  len = abs n + 1
  p = if n < 0 then -1 else 1
