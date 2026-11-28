module HyperSphere where

inSphere :: (Ord a, Num a) => [a] -> a -> Bool
inSphere xs r = sum (map (^ 2) xs) <= r ^ 2
