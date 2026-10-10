module Kata where

import Data.Function

data Player = Player {team :: String, ppg :: Double} deriving (Show)

sumPpg :: Player -> Player -> Double
sumPpg = (+) `on` ppg
