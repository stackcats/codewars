module BasesEverywhere (baseFinder) where

import Data.Char
import Data.List

baseFinder :: [String] -> Int
baseFinder xs = until (`notElem` ys) succ 1
 where
  ys = map digitToInt $ nub $ concat xs
