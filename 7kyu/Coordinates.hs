module Coordinates where

coordinates :: Double -> Double -> (Double, Double)
coordinates theta r = (cos radian * r, sin radian * r)
 where
  radian = theta * pi / 180
