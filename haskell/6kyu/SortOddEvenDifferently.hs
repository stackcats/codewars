module SortOddEvenDifferently (paritySort) where

import Data.List
import Data.Ord

paritySort :: [Int] -> [Int]
paritySort xs = go (sortOn Down l) (sort r) xs
 where
  (l, r) = partition even xs

  go es os [] = []
  go [] odds _ = odds
  go evens [] _ = evens
  go (e : es) (o : os) (y : ys)
    | even y = e : go es (o : os) ys
    | otherwise = o : go (e : es) os ys
