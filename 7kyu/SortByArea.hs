module SortByArea (sortByArea) where

import Data.List
import Preloaded (Shape (..)) -- data Shape = Rectangle { width, length :: Double } | Circle { radius :: Double }
import Preloaded qualified as P

sortByArea :: [Shape] -> [Shape]
sortByArea = sortOn area

area :: Shape -> Double
area Rectangle{width, P.length} = width * length
area Circle{radius} = pi * radius * radius
