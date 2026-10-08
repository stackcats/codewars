module DotCalculator (calculator) where

import Data.List
import Data.List.Split

calculator :: String -> String
calculator txt = replicate go '.'
 where
  [l, r] = splitOneOf "+-*//" $ filter (/= ' ') $ delete '/' txt
  (a, b) = (length l, length r)

  go
    | '*' `elem` txt = a * b
    | '+' `elem` txt = a + b
    | '-' `elem` txt = a - b
    | otherwise = a `div` b
