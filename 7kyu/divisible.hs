module Divisors where

import Data.Bool

divisors :: (Integral a) => a -> Int
divisors x = sum [bool 2 1 (i == x `div` i) | i <- [1 .. n], x `rem` i == 0]
 where
  n = floor $ sqrt $ fromIntegral x
