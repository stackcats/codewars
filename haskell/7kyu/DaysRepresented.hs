module DaysRepresented.JorgeVS.Kata where

import Data.List

daysRepresented :: [(Int, Int)] -> Int
daysRepresented = go [] . sortOn fst
 where
  go [] [] = 0
  go [(a, b)] [] = b - a + 1
  go [] (x : xs) = go [x] xs
  go [(a, b)] ((c, d) : xs)
    | c <= b = go [(a, max b d)] xs
    | otherwise = b - a + 1 + go [(c, d)] xs
