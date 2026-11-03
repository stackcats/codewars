module Codewars.Kata.Arithmetic where

import Data.List

findMissing :: (Integral n) => [n] -> n
findMissing [a, b, c]
  | d1 > d2 = a + d2
  | otherwise = b + d1
 where
  d1 = b - a
  d2 = c - b
findMissing (a : b : c : d : xs)
  | d1 == d2 = go (c : d : xs) d1
  | d1 == d3 = b + d1
  | d2 == d3 = a + d2
 where
  d1 = b - a
  d2 = c - b
  d3 = d - c

  go (a : b : xs) d
    | b - a /= d = a + d
    | otherwise = go (b : xs) d
