module CircularlySortedArray (isCircleSorted) where

import Data.List

isCircleSorted :: (Ord a, Show a) => [a] -> Bool
isCircleSorted = go []
 where
  go l [] = True
  go [] (r : rs) = go [r] rs
  go xs@(l : ls) ys@(r : rs)
    | l <= r = go (r : l : ls) rs
    | otherwise = reverse xs == sort xs && ys == sort ys && last xs >= last ys
