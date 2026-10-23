module ChangableDiagonal (matrixDiagonal) where

matrixDiagonal :: [[Int]] -> Int -> Int
matrixDiagonal matrix value = sum [matrix !! i !! j | j <- [0 .. size - 1], let i = j + value, i >= 0, i < size]
 where
  size = length matrix
