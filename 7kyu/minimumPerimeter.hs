module Kata (minimumPerimeter) where

minimumPerimeter :: Integer -> Integer
minimumPerimeter area = minimum [(a + area `div` a) * 2 | a <- [1 .. x], area `mod` a == 0]
 where
  x = ceiling $ sqrt $ fromIntegral area
