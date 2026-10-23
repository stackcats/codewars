module SlotMachine (slot) where

import Data.List

slot :: String -> Int
slot s = case reverse $ sort $ map length $ group s of
  [5] -> 1000
  [4, 1] -> 800
  [3, 2] -> 500
  [3, 1, 1] -> 300
  [2, 2, 1] -> 200
  [2, 1, 1, 1] -> 100
  _ -> 0
