module Codewars.G964.Braking where

dist :: Double -> Double -> Double
dist v mu = v' * v' / (2 * mu * 9.81) + v'
 where
  v' = v * 1000 / 3600

speed :: Double -> Double -> Double
speed d mu = (sqrt (b * b - 4 * a * c) - b) / (2 * a) * 3600 / 1000
 where
  a = 1 / (2 * mu * 9.81)

  b = 1
  c = (-d)
