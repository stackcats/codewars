module Codewars.G964.FindEven where

findEvenIndex :: [Int] -> Int
findEvenIndex xs = find xs 0 0 (sum xs)

find lst i lft rht
  | lst == [] = -1
  | lft == rht - x = i
  | otherwise = find xs (i + 1) (lft + x) (rht - x)
 where
  (x : xs) = lst
