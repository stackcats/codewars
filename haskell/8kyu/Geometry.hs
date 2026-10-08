module Geometry (circleArea) where

import Preloaded (Circle (..), Point (..))

{-
-- defined in Preloaded

data Point = Point
  { xValue :: Double
  , yValue :: Double
  } deriving (Show, Eq)

data Circle = Circle
  { center :: Point
  , radius :: Double
  } deriving (Show, Eq)
-}

circleArea :: Circle -> Double
circleArea c = pi * (radius c) ** 2
