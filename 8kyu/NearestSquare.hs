module NearestSquare where

nearestSquare :: Int -> Int
nearestSquare = (^ 2) . round . sqrt . fromIntegral
