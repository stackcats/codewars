module LastSurvivors (lastSurvivors) where

import Data.List

lastSurvivors :: [String] -> [Int] -> String
lastSurvivors [] _ = ""
lastSurvivors ss xs = filter (/= ' ') $ concat $ foldl update mat $ zip [0 ..] xs
 where
  mat = map (reverse . filter (/= ' ')) $ transpose ss

update mat (i, n) = l ++ [m'] ++ r
 where
  (l, (m : r)) = splitAt i mat
  m' = drop n m
