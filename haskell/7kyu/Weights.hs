module Codewars.Weights where

{- | Takes a bottleWeight and scale of
  the bottle to its contents
-}
contentWeight :: Int -> String -> Int
contentWeight weight str
  | scale == "larger" = x * n
  | otherwise = x
 where
  [n', _, scale] = words str
  n = read n'
  x = weight `div` (n + 1)
