module KnightsTour (check) where

check :: Int -> Int -> Bool
check a b
  | a `elem` [5, 6] && b == 3 = False
  | a < 3 || b < 3 = False
  | a == b && a < 5 = False
  | b > a = check b a
  | otherwise = True
