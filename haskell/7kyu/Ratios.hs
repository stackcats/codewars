module Ratios (mergeRatios) where

import Data.List
import Data.List.Split

mergeRatios :: String -> String -> String
mergeRatios ratio1 ratio2 = intercalate ":" $ map (show . (`div` g)) lst
 where
  [a, b] = map read $ splitOn ":" ratio1
  [c, d] = map read $ splitOn ":" ratio2
  lst = [a * c, b * c, d * b]
  g = foldl1 gcd lst
