module Codewars.SumAndMultiply where

sumAndMultiply :: Int -> Int -> [Int]
sumAndMultiply s m = case [[a, s - a] | a <- [0 .. 1000], a * (s - a) == m] of
  [] -> []
  xs -> head xs
