module NumbersInOrder (isAscOrder) where

isAscOrder :: [Int] -> Bool
isAscOrder [] = True
isAscOrder [_] = True
isAscOrder (a : b : xs)
  | a > b = False
  | otherwise = isAscOrder (b : xs)
