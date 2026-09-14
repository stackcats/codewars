module OdderThanTheRest (oddest) where

import Data.List

oddest :: [Int] -> Int
oddest = maximumBy f

f a b
  | odd a && even b = GT
  | even a && odd b = LT
  | otherwise = f (a `div` 2) (b `div` 2)
