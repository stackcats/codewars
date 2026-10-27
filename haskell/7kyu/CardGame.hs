module CardGame (solution) where

import Data.List

solution :: [Int] -> [Int] -> [Int] -> Bool
solution frank sam tom
  | 0 `elem` frank = solution (frank \\ [0]) (init sam) (init tom)
  | otherwise = count (zipWith max sam tom) frank >= 2

count [] _ = 0
count (x : xs) ys =
  case find (> x) ys of
    Nothing -> 0
    Just y -> 1 + count xs (ys \\ [y])
