module XorReduction (xorReduction) where

import Data.Bits

xorReduction :: Int -> Int -> Int
xorReduction m n = f (m - 1) `xor` f n
 where
  f m = case m `mod` 4 of
    0 -> m
    1 -> 1
    2 -> m + 1
    3 -> 0
