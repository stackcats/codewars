module Ball where

bouncingBall :: Double -> Double -> Int
bouncingBall h p
  | h * p <= 1 = 1
  | otherwise = 1 + bouncingBall (h * p) p
