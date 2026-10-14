module ArraySquareUp (squareUp) where

squareUp :: Int -> [Int]
squareUp n = concatMap (\i -> replicate (n - i) 0 ++ [i, i - 1 .. 1]) [1 .. n]
