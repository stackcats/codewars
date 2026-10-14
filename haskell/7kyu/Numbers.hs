module Codewars.Numbers where

abundantNumber :: Int -> Bool
abundantNumber num = sum [i | i <- [1 .. num - 1], num `mod` i == 0] > num
