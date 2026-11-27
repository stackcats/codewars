module IterateN (iterateN) where

iterateN :: Int -> (a -> a) -> (a -> a)
iterateN n f
  | n <= 0 = id
  | otherwise = g n
 where
  g i x
    | i == 1 = f x
    | otherwise = g (i - 1) (f x)
