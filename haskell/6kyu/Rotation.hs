module Codewars.Kata.Rotation where

import Data.List
import Data.Maybe

shiftedDiff :: String -> String -> Int
shiftedDiff a b
  | a == b = 0
  | length a /= length b = -1
  | sort a /= sort b = -1
  | otherwise = fromMaybe (-1) $ findIndex (== b) $ take (length a) $ iterate (\s -> last s : init s) a
