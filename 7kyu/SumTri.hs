module Codewars.Kata.SumTri where

sunTriNumbers :: Integer -> Integer
sunTriNumbers n
  | n <= 0 = 0
  | otherwise = sum [(i + 1) * i `div` 2 | i <- [1 .. n]]
