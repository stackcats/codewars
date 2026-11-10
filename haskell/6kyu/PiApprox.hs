module Codewars.Kata.PiApprox where

trunc10Dble :: Double -> Double
trunc10Dble d = (fromInteger $ truncate $ d * (10 ^ 10)) / (10.0 ^^ 10)

iterPi :: Double -> (Integer, Double)
iterPi epsilon = go 1 4.0
 where
  go i p
    | abs (pi - p) < epsilon = (i, trunc10Dble p)
    | otherwise = go (i + 1) nextP
   where
    j = fromIntegral i * 2 + 1
    nextP = p + if even i then 4 / j else (-4) / j
