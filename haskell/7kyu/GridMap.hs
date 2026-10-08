module GridMap where

gridMap :: (a -> b) -> [[a]] -> [[b]]
gridMap f = map (map f)
