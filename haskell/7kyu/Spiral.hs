module Spiral where

-- | @m@ and @n@ are positive integers
createBox :: Int -> Int -> [[Int]]
createBox m n
  | even n = xs ++ reverse xs
  | otherwise = xs ++ [row (x + 1) m] ++ reverse xs
 where
  x = n `div` 2
  xs = [row i m | i <- [1 .. x]]

row n width
  | 2 * n < width = [1 .. n] ++ replicate (width - 2 * n) n ++ [n, n - 1 .. 1]
  | even width = [1 .. x] ++ [x, x - 1 .. 1]
  | odd width = [1 .. x] ++ [x + 1, x .. 1]
 where
  x = width `div` 2
