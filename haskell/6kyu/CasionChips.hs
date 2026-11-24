module Kata (solve) where

import Data.List

solve :: [Int] -> Int
solve = go . sort
go [0, b, c] = min b c
go [a, b, c] = 1 + go (sort [a - 1, b, c - 1])
