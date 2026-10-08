module Kata where

dontGiveMeFive :: Int -> Int -> Int
dontGiveMeFive start end = length [n | n <- [start .. end], '5' `notElem` (show n)]
