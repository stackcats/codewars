module Folding where

folding :: Int -> Int -> Integer
folding a b
  | a == b = 1
  | a < b = folding b a
  | otherwise = 1 + folding (a - b) b
