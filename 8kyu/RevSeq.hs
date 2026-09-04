module RevSeq where

reverseSeq :: Int -> [Int]
reverseSeq n = [n, n - 1 .. 1]
