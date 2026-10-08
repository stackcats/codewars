module CandyProblem where

candies :: [Int] -> Int
candies [] = -1
candies [_] = -1
candies xs = sum $ map (t -) xs
 where
  t = maximum xs
