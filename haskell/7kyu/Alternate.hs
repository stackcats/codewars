module Codewars.Exercises.Alternate where

alternateSqSum :: [Integer] -> Maybe Integer
alternateSqSum [] = Nothing
alternateSqSum xs = Just . sum . zipWith (^) xs $ cycle [1, 2]
