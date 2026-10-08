module SignChange (count) where

import Data.Bool

count :: (Num a, Ord a) => [a] -> Int
count [] = 0
count (x : xs) = fst $ foldl (\(ct, prev) n -> bool (succ ct, n) (ct, n) (sameSign prev n)) (0, x) xs

sameSign a b
  | a < 0 && b < 0 = True
  | a >= 0 && b >= 0 = True
  | otherwise = False
