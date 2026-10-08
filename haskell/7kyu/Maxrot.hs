module Codewars.G964.Maxrot where

maxRot :: Integer -> Integer
maxRot n = maximum $ map read $ scanl rot s [0 .. size - 1]
 where
  s = show n
  size = length s

rot s 0 = drop 1 s ++ [head s]
rot s n = take n s ++ rot (drop n s) 0
