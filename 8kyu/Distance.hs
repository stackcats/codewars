{-# LANGUAGE OverloadedRecordDot #-}

module Distance (distance) where

import Preloaded (Point (..)) -- data Point = Point { x :: Double, y :: Double }

distance :: Point -> Point -> Double
distance a b = ((a.x - b.x) ** 2 + (a.y - b.y) ** 2) ** 0.5
