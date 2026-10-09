module Codewars.Kata.ScoringTests where

scoreTest :: (Integral a) => [a] -> a -> a -> a -> a
scoreTest li a b c = sum $ map m li
 where
  m 0 = a
  m 1 = b
  m 2 = (-c)
