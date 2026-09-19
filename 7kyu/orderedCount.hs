module Kata where

orderedCount :: String -> [(Char, Int)]
orderedCount = foldl update []

update [] x = [(x, 1)]
update ((y, n) : ys) x
  | x == y = (x, n + 1) : ys
  | otherwise = (y, n) : update ys x
