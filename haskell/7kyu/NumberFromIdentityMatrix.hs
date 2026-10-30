module NumberFromIdentityMatrix (solve) where

import Data.Bits

solve :: Int -> Integer
solve n = sum $ map (\i -> 1 `shiftL` (i + n * i - n - 1)) [n, n - 1 .. 1]
