module WhatComesAfter (comesAfter) where

import Data.Char

comesAfter :: String -> Char -> String
comesAfter (x : y : s) c
  | toLower c == toLower x && isAlpha y = y : comesAfter (y : s) c
  | otherwise = comesAfter (y : s) c
comesAfter _ _ = []
