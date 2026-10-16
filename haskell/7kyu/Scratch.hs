module Scratch where

scratch :: [String] -> Int
scratch = sum . map f
 where
  f s
    | a == b && b == c = read m
    | otherwise = 0
   where
    [a, b, c, m] = words s
