module Kata (x) where

import Data.List

x :: Int -> String
x n = intercalate "\n" $ map genRow [(i, n - i + 1) | i <- [1 .. n]]
 where
  genRow (i, j) = map f [1 .. n]
   where
    f x
      | x == i || x == j = '■'
      | otherwise = '□'
