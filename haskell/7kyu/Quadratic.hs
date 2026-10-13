module Quadratic where

roots :: Double -> Double -> Double -> Maybe Double
roots a b c
  | b ^ 2 < 4 * a * c = Nothing
  | otherwise = Just $ (-b) / a
