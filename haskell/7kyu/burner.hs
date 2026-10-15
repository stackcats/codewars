module Kata where

burner :: Int -> Int -> Int -> (Int, Int, Int)
burner c h o = (water, co2, methane)
 where
  water = min (h `div` 2) o
  h' = h - 2 * water
  o' = o - water
  co2 = min c (o' `div` 2)
  c' = c - co2
  methane = min c' (h' `div` 4)
