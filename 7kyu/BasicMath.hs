module BasicMath (calc) where

import Text.Regex.TDFA

calc :: String -> String
calc s = go xs ops
 where
  xs = map read $ getAllTextMatches (s =~ "[0-9]+")
  ops = getAllTextMatches (s =~ "[a-z]+")

go xs [] = show $ head xs
go (a : b : xs) ("plus" : ops) = go ((a + b) : xs) ops
go (a : b : xs) ("minus" : ops) = go ((a - b) : xs) ops
