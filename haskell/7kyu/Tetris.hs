module Tetris (score) where

points = [0, 40, 100, 300, 1200]

score :: [Int] -> Int
score = fst . foldl f (0, 10)
 where
  f (acc, level) n = (acc + (points !! n) * (level `div` 10), level + n)
