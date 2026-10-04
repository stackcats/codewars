module Monotone where

{- | Return true if the elements of the list are non-decreasing.
  If the list is empty, return True.
-}
isMonotone :: (Ord a) => [a] -> Bool
isMonotone (a : b : xs)
  | a > b = False
  | otherwise = isMonotone (b : xs)
isMonotone _ = True
