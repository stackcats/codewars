module Kata (Shape (..)) where

import Data.Ord

data Shape
  = Square {side :: Double}
  | Rectangle {width :: Double, height :: Double}
  | Triangle {base :: Double, height :: Double}
  | Circle {radius :: Double}
  | CustomShape {area :: Double}
  deriving (Show)

area' :: Shape -> Double
area' (Square w) = w * w
area' (Rectangle w h) = w * h
area' (Triangle b h) = b * h / 2
area' (Circle r) = pi * r * r
area' (CustomShape a) = a

instance Eq Shape where
  s1 == s2 = area' s1 == area' s2

instance Ord Shape where
  compare = comparing area'
