module Codewars.Kata.Decimals where

twoDecimalPlaces :: Double -> Double
twoDecimalPlaces = (/ 100) . fromIntegral . truncate . (* 100)
