module Haskell.SylarDoom.FruitMachine where

import Data.List
import Data.Maybe

fruit :: [[String]] -> [Int] -> Int
fruit reels spins
  | a == b && a == c = 10 * score a
  | a /= b && a /= c && b /= c = 0
  | a == b = score a * plus c
  | a == c = score a * plus b
  | b == c = score b * plus a
 where
  xs@[a, b, c] = zipWith (!!) reels spins

plus "Wild" = 2
plus _ = 1

score :: String -> Int
score s = fst . fromJust $ find ((== s) . snd) t
 where
  t = zip [10, 9 ..] ["Wild", "Star", "Bell", "Shell", "Seven", "Cherry", "Bar", "King", "Queen", "Jack"]
