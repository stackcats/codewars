module ConsecutiveItems (consecutive) where

consecutive :: [Int] -> Int -> Int -> Bool
consecutive (x : y : xs) a b
  | (x, y) `elem` [(a, b), (b, a)] = True
  | otherwise = consecutive (y : xs) a b
consecutive _ _ _ = False
