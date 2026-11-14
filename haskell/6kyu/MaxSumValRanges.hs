module Kata.MaxSumValRanges (maxSum) where

maxSum :: [Int] -> [(Int, Int)] -> Int
maxSum xs = maximum . map (\(a, b) -> sum $ take (b - a + 1) $ drop a xs)
