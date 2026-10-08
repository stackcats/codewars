module Codewars.Kata.Smaller where

smaller :: (Ord a) => [a] -> [Int]
smaller [] = []
smaller (x : xs) = (length $ filter (< x) xs) : smaller xs
