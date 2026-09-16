module SimplePairs where

import Data.List.Split

pairs :: [Int] -> Int
pairs = length . filter f . chunksOf 2
 where
  f [a, b] = abs (a - b) == 1
  f _ = False
