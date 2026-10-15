module Codewars.Kata.NumberProperties where

import Codewars.Kata.NumberProperties.Property

-- data Property = Property Bool   Bool  Bool
--                          prime  even  10*

numberProperty :: (Integral n) => n -> Property
numberProperty n = Property (isPrime n) (even n) (n `mod` 10 == 0)

isPrime n
  | n < 2 = False
  | n == 2 = True
  | otherwise = all ((/= 0) . (n `mod`)) [2 .. n - 1]
