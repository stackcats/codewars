module LastSurvivors (lastSurvivors) where

import Data.Char
import Data.List

lastSurvivors :: String -> String
lastSurvivors s
  | s == nub s = s
  | otherwise = lastSurvivors $ concatMap f $ group $ sort s
 where
  f (c : _ : s) = (next c) : f s
  f s = s
  next c = chr $ 97 + (ord c - 97 + 1) `mod` 26
