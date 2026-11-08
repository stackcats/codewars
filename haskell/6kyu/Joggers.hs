module Joggers where

nbrOfLaps :: Integer -> Integer -> (Integer, Integer)
nbrOfLaps bob charles = (charles `div` g, bob `div` g)
 where
  g = gcd bob charles
