module Codewars.Kata.Sum2Total where

total :: (Num a) => [a] -> a
total [] = 0
total [x] = x
total xs = total $ zipWith (+) xs $ drop 1 xs
