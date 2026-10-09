module Codewars.Kata.AddingParameters where

add :: (Num a, Enum a) => [a] -> a
add = sum . zipWith (*) [1 ..]
