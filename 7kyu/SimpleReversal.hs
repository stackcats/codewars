module SimpleReversal where

import Data.Bool

solve :: String -> String
solve ys = go ys xs
 where
  xs = reverse $ filter (/= ' ') ys

  go [] _ = []
  go (' ' : ys) xs = ' ' : go ys xs
  go (_ : ys) (x : xs) = x : go ys xs
