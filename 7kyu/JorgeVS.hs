module Cartesian.Neighbor.JorgeVS where

-- retrieve a sorted List
cartesianNeighbor :: Int -> Int -> [(Int, Int)]
cartesianNeighbor x y = [(x + i, y + j) | i <- [-1 .. 1], j <- [-1 .. 1], (i, j) /= (0, 0)]
