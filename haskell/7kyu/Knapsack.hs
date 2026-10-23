module Knapsack (knapsackLight) where

knapsackLight :: Int -> Int -> Int -> Int -> Int -> Int
knapsackLight value1 weight1 value2 weight2 maxW
  | weight1 + weight2 <= maxW = value1 + value2
  | weight1 <= maxW && weight2 <= maxW = max value1 value2
  | weight1 <= maxW = value1
  | weight2 <= maxW = value2
  | otherwise = 0
