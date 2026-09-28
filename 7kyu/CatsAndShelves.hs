module CatsAndShelves (solve) where

solve :: Word -> Word -> Word
solve m n
  | m == n = 0
  | m + 3 <= n = 1 + solve (m + 3) n
  | otherwise = 1 + solve (m + 1) n
