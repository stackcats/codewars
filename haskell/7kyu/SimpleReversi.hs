module SimpleReversi where

import Data.List
import Data.Maybe

solve :: Int -> Int -> Int
solve n k = fromJust $ findIndex (== k) $ go [0 .. n - 1]
 where
  go [] = []
  go xs = let (y : ys) = reverse xs in y : go ys
