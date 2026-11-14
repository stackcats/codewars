module Codewars.G964.Bankerplan where

fortune :: Int -> Double -> Int -> Int -> Double -> Bool
fortune f0 p c0 n i = go f0 c0 (n - 1)
 where
  go f c n
    | n < 2 = f >= c
    | otherwise = go (r (f - c) p) (r c i) (n - 1)

  r :: Int -> Double -> Int
  r x y = floor $ fromIntegral x * (1 + y / 100)
