module BugsLife.Kata (shortestDistance) where

import Data.List

shortestDistance :: Double -> Double -> Double -> Double
shortestDistance a b c = minimum [sqrt ((a + b) ^ 2 + c ^ 2), sqrt ((a + c) ^ 2 + b ^ 2), sqrt ((c + b) ^ 2 + a ^ 2)]
