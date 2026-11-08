module Rounders (rounders) where

rounders :: Int -> Int
rounders = go 0
 where
  go p n
    | n < 10 = p + n
    | p + d >= 5 = (go 1 m) * 10
    | otherwise = (go 0 m) * 10
   where
    (m, d) = n `divMod` 10
