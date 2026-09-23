module Stanton (stantonMeasure) where

stantonMeasure :: [Int] -> Int
stantonMeasure arr = m
 where
  n = length $ filter (== 1) arr
  m = length $ filter (== n) arr
