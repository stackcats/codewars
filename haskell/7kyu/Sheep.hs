module Sheep where

lostSheep :: [Int] -> [Int] -> Int -> Int
lostSheep xs ys n = n - (sum xs) - (sum ys)
