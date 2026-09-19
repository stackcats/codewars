module Codewars.G964.Countdig where

import Data.Char

nbDig :: Int -> Int -> Int
nbDig n d = sum $ map f [k * k | k <- [0 .. n]]
 where
  c = intToDigit d
  f n = length $ filter (== c) $ show n
