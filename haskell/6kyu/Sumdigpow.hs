module Codewars.G964.Sumdigpow where

import Data.Char

sumDigPow :: Int -> Int -> [Int]
sumDigPow a b = [i | i <- [a .. b], f i]
 where
  f n = m == n
   where
    m = sum . zipWith (flip (^)) [1 ..] . map digitToInt $ show n
