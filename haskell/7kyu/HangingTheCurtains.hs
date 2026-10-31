module HangingTheCurtains (numberOfHooks) where

numberOfHooks :: Double -> Double -> Int
numberOfHooks l d
  | l <= d = 2
  | l / 2 <= d = 3
  | otherwise = 2 * (numberOfHooks (l / 2) d) - 1
