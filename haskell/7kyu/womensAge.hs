module Kata (womensAge) where

import Text.Printf

womensAge :: Int -> String
womensAge n = printf "%d? That's just %d, in base %d!" n (f n base) base
 where
  base = head [x | x <- [10 ..], f n x `elem` [20, 21]]
  f x y = let (q, r) = x `divMod` y in q * 10 + r
