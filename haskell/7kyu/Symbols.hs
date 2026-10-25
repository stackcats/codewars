module Symbols where

import Data.List
import Text.Printf

transform :: String -> String
transform [] = []
transform (x : xs)
  | ct == 1 = x : transform xs
  | otherwise = (printf "%c%d" x ct) ++ (transform $ filter (/= x) xs)
 where
  ct = succ $ length $ filter (== x) xs
