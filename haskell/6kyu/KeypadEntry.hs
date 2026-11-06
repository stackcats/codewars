module Haskell.Codewars.KeypadEntry where

import Data.Char
import Data.List
import Data.Maybe

ks = ["", "", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"]

presses :: String -> Int
presses [] = 0
presses (x : xs) = ct (toUpper x) + presses xs
 where
  ct x
    | isDigit x = case x of
        '1' -> 1
        '0' -> 2
        '9' -> 5
        _ -> 4
    | x `elem` "*#" = 1
    | x == ' ' = 1
    | otherwise = succ $ fromJust $ findIndex (== x) $ fromJust $ find (x `elem`) ks
