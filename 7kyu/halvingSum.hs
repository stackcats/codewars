module Kata (halvingSum) where

halvingSum :: Int -> Int
halvingSum = sum . takeWhile (/= 0) . iterate (`div` 2)
