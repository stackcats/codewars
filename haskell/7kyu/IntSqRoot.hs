module Codewars.G964.IntSqRoot where

intRac :: Integer -> Integer -> Integer
intRac n x = go x 1
 where
  go x ct
    | abs (nx - x) < 1 = ct
    | otherwise = go nx (succ ct)
   where
    nx = floor $ (fromIntegral x + fromIntegral n / fromIntegral x) / 2
