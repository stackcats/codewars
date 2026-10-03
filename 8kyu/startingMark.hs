module Solution (startingMark) where

-- Remember: Body height of 1.52 m --> starting mark: 9.45 m
--           Body height of 1.83 m --> starting mark: 10.67 m
-- All other starting marks are based on these guidelines!

a = 1.22 / 0.31
b = 9.45 - 1.52 * a

startingMark :: Double -> Double
startingMark x = a * x + b
