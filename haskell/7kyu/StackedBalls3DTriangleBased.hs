module StackedBalls3D (stack) where

stack :: Int -> Double
stack 0 = 0
stack n = succ $ (fromIntegral n - 1) * sqrt (2 / 3)
