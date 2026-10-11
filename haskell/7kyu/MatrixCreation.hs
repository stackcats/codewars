module MatrixCreation (getMatrix) where

getMatrix :: Int -> [[Int]]
getMatrix n = map f [0 .. n - 1]
 where
  row = replicate n 0
  f i = let (l, (x : r)) = splitAt i row in l ++ (1 : r)
