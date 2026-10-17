module SortTransform where

import Data.Char
import Data.List
import Data.Ord

sortTransform :: [Int] -> String
sortTransform xs = part1 ++ "-" ++ part2 ++ "-" ++ part3 ++ "-" ++ part2
 where
  toWord xs = map chr [a, b, d, c]
   where
    (a : b : _) = xs
    (c : d : _) = reverse xs
  part1 = toWord xs
  part2 = toWord $ sort xs
  part3 = toWord $ sortOn Down xs
