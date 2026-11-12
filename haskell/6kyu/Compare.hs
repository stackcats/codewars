module Codewars.Exercise.Compare where

import Data.Function
import Data.List.Split

compareVersions :: String -> String -> Ordering
compareVersions = cmp `on` (map read . splitOn ".")

cmp :: [Int] -> [Int] -> Ordering
cmp [] [] = EQ
cmp [] _ = LT
cmp _ [] = GT
cmp (x : xs) (y : ys)
  | x < y = LT
  | x > y = GT
  | otherwise = cmp xs ys
