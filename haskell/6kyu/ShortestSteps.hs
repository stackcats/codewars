module ShortestSteps (steps) where

steps :: Int -> Int
steps 1 = 0
steps n
  | even n = succ $ steps $ n `div` 2
  | otherwise = succ $ steps $ pred n
