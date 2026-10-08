module Haskell.SylarDoom.SumContinuously where

add :: (Num a) => [a] -> [a]
add = add' 0 []

add' :: (Num a) => a -> [a] -> [a] -> [a]
add' _ xs [] = reverse xs
add' p xs (y : ys) = add' np (np : xs) ys
 where
  np = p + y
