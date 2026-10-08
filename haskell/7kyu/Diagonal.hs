module Diagonal where

diagonalSum :: [[Int]] -> Int
diagonalSum = sum . zipWith (flip (!!)) [0 ..]
