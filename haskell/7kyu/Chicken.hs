module Chicken where

chickenOptions :: Int -> [Int]
chickenOptions = filter f . enumFromTo 0
 where
  f x
    | x `mod` 3 == 0 = True
    | x `mod` 10 == 0 = True
    | x < 10 = False
    | otherwise = f (x - 10)
