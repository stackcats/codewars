module CountCubes (count) where

count :: Int -> Int
count 0 = 1
count n = (n + 1) ^ 3 - (n - 1) ^ 3
