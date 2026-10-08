module EveryPossibleSum.Kata (digits) where

import Data.Char

digits :: (Integral a) => a -> [a]
digits n = [a + b | (i, a) <- ys, (j, b) <- ys, i < j]
 where
  ys = zip [0 ..] $ f [] n

f xs 0 = xs
f xs n = f (n `rem` 10 : xs) (n `div` 10)
