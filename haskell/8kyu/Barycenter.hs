module Codewars.G964.Barycenter where

barTriang :: (Double, Double) -> (Double, Double) -> (Double, Double) -> (Double, Double)
barTriang (a, b) (c, d) (e, f) = (fx a c e, fx b d f)
 where
  fx :: Double -> Double -> Double -> Double
  fx a b c = (fromIntegral $ round $ (a + b + c) / 3 * 10000) / 10000
