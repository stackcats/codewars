module Codewars.G964.Arcparab where

import Data.List.Split

-- n number of intervals
lenCurve :: Integer -> Double
lenCurve n = sum $ map (\[a, c] -> distance a (f a) c (f c)) $ divvy 2 1 [0, x .. 1]
 where
  x :: Double
  x = 1 / fromIntegral n

  f = (^ 2)

  distance a b c d = sqrt $ (a - c) ^ 2 + (b - d) ^ 2
