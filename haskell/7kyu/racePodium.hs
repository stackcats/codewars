module Kata (racePodium) where

import Data.List

racePodium :: Int -> (Int, Int, Int)
racePodium blocks = go b a c
 where
  a = blocks `div` 3 + blocks `mod` 3
  b = a - 1
  c = blocks - a - b
  go b a c
    | b <= c = go (b + 1) a (c - 1)
    | b >= a = go (b - 1) (a + 1) c
    | c > 1 && b < a - 1 = go (b + 1) a (c - 1)
    | otherwise = (b, a, c)
