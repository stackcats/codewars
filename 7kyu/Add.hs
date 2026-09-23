module Add (add) where

import Data.Char
import Data.Function

add :: Int -> Int -> Int
add = (f []) `on` (reverse . map digitToInt . show)
 where
  f zs [] [] = read $ concatMap show zs
  f zs [] (y : ys) = f (y : zs) [] ys
  f zs (x : xs) [] = f (x : zs) xs []
  f zs (x : xs) (y : ys) = f ((x + y) : zs) xs ys
