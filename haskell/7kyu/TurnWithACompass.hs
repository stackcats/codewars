module TurnWithACompass (direction) where

import Data.List

import Preloaded (Direction (..))

directions = [N, NE, E, SE, S, SW, W, NW]

direction :: Direction -> Int -> Direction
direction facing turn = directions !! ((turn `div` 45 + 8 + i) `mod` 8)
 where
  Just i = facing `elemIndex` directions
