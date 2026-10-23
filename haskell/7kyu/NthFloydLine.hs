module NthFloydLine where

nthFloyd :: Int -> Int
nthFloyd n = go 1
 where
  go line
    | (1 + line) * line `div` 2 >= n = line
    | otherwise = go (succ line)
