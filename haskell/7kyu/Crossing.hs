module Crossing where

crossingSum :: [[Int]] -> Int -> Int -> Int
crossingSum mat a b =
  sum (mat !! a) + sum [r !! b | r <- mat] - mat !! a !! b
