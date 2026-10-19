module Codewars.Numbers where

twoCount :: Int -> Int
twoCount n
  | even n = succ . twoCount $ n `div` 2
  | otherwise = 0
