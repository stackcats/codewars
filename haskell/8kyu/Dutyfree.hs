module Dutyfree where

dutyFree :: Float -> Float -> Float -> Int
dutyFree p d c = floor $ c * 100 / (p * d)
