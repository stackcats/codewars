module Kata (quarterOf) where

quarterOf :: Int -> Int
quarterOf month
  | month < 4 = 1
  | month < 7 = 2
  | month < 10 = 3
  | otherwise = 4
