module Competition (lowestPossiblePlace) where

lowestPossiblePlace :: Int -> Int -> Int
lowestPossiblePlace n score
  | p > n = p
  | otherwise = -1
 where
  s = (1 + n) * n `div` 2
  p = score - 1 - s
