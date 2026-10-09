module Kata.InvisibleCubes where

notVisibleCubes :: Integer -> Integer
notVisibleCubes n
  | n < 3 = 0
  | otherwise = (n - 2) ^ 3
