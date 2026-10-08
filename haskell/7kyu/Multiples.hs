module Multiples where

multiples :: Int -> Double -> [Double]
multiples m n = [n * (fromIntegral i) | i <- [1 .. m]]
