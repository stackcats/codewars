module BubblesortOnce (bubblesortOnce) where

bubblesortOnce :: [Int] -> [Int]
bubblesortOnce (a : b : xs)
  | a <= b = a : bubblesortOnce (b : xs)
  | otherwise = b : bubblesortOnce (a : xs)
bubblesortOnce xs = xs
