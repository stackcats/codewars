module MissingNumber (missingNumber) where

import Data.Maybe
import Data.Tuple

missingNumber :: [[Maybe Int]] -> [[Maybe Int]] -> Int
missingNumber b1 b2 = (x1 - x2 - y1 + y2) * if (i + j) `rem` 2 == 0 then 1 else -1
 where
  f (x, y) [] = (x, y)
  f (x, y) [n] = (x + (fromMaybe 0 n), y)
  f (x, y) (a : b : lst) = f (x + (fromMaybe 0 a), y + (fromMaybe 0 b)) lst

  (x1, y1) = foldl ((swap .) . f) (0, 0) b1
  (x2, y2) = foldl ((swap .) . f) (0, 0) b2

  (i, j) = head [(i, j) | (row, i) <- zip b2 [0 ..], (n, j) <- zip row [0 ..], n == Nothing]
