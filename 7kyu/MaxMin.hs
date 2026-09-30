module MaxMin where

import Data.List

solve :: [Int] -> [Int]
solve xs = take (length xs) $ concat $ zipWith (\a b -> [a, b]) zs ys
 where
  ys = sort xs
  zs = reverse ys
