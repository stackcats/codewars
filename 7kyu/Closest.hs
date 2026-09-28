module Closest where

closestMultiple10 :: Int -> Int
closestMultiple10 = (* 10) . round . (+ 0.05) . (/ 10) . fromIntegral
