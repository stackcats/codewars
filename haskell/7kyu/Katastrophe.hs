module Codewars.Kata.Katastrophe where

strongEnough :: [[Int]] -> Int -> String
strongEnough earthquake age
  | fromIntegral a >= b = "Needs Reinforcement!"
  | otherwise = "Safe!"
 where
  a = product $ map sum earthquake
  b = (0.99 ^ age) * 1000
