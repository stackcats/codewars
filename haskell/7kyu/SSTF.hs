module SSTF (sstf) where

import Data.List

sstf :: [Int] -> Int -> Int
sstf xs x = go (reverse l) x r
 where
  (l, r) = partition ((< x) . snd) $ sortOn snd $ zip [0 ..] xs

  go [] x [] = 0
  go [] x ((_, r) : rs) = r - x + go [] r rs
  go ((_, l) : ls) x [] = x - l + go ls l []
  go ((i, l) : ls) x ((j, r) : rs)
    | d1 < d2 = d1 + go ls l ((j, r) : rs)
    | d1 > d2 = d2 + go ((i, l) : ls) r rs
    | i < j = d1 + go ls l ((j, r) : rs)
    | otherwise = d2 + go ((i, l) : ls) r rs
   where
    d1 = x - l
    d2 = r - x
