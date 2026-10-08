module InverseSlicer where

inverseSlice :: [a] -> Int -> Int -> [a]
inverseSlice xs a b = take a xs ++ drop b xs
