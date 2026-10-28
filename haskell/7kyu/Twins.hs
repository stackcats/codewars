module Twins (evenTwins) where

import Data.List

evenTwins :: [Int] -> Int
evenTwins xs = length . nub $ [x + y | (i, x) <- ys, (j, y) <- ys, i /= j, even (x + y)]
 where
  ys = zip [0 ..] xs
