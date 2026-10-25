module MissingTree (findTheMissingTree) where

import Data.List

findTheMissingTree :: [Int] -> Int
findTheMissingTree trees
  | length l == 1 = fst $ head l
  | otherwise = fst $ head r
 where
  xs = map (\xs -> (head xs, length xs)) . group $ sort trees
  (_, l0) = head xs
  (l, r) = partition (\(_, l) -> l == l0) xs
