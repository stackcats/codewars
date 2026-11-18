module PointsInCircle.Kata (points) where

points :: Int -> Int
points r = length [(x, y) | x <- [-r .. r], y <- [-r .. r], x ^ 2 + y ^ 2 <= r ^ 2]
