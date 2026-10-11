module ShiftLeft where

shiftLeft :: String -> String -> Int
shiftLeft s t = length s - size + length t - size
 where
  size = length $ takeWhile (uncurry (==)) $ zip (reverse s) (reverse t)
