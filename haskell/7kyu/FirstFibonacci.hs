module FirstFibonacci (solution) where

solution :: Int -> Int -> (Int, Int)
solution a b
  | b - a <= a = solution (b - a) a
  | otherwise = (a, b)
