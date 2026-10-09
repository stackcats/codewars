module SeqList where

seqlist :: Int -> Int -> Int -> [Int]
seqlist first c l = take l [first, first + c ..]
