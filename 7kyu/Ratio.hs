module Codewars.Kata.Ratio where

import Text.Printf

showRatio :: Int -> Int -> Maybe String
showRatio a b
  | a == 0 || b == 0 = Nothing
  | otherwise = Just $ printf "%d:%d" (a `div` g) (b `div` g)
 where
  g = gcd a b
