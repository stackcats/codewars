module TrilingualDemocracy (trilingualDemocracy) where

import Data.List
import Data.Maybe

trilingualDemocracy :: [Char] -> Char
trilingualDemocracy [a, b, c]
  | a == b && b == c = a
  | a == b = c
  | b == c = a
  | a == c = b
  | otherwise = fromJust $ find (`notElem` [a, b, c]) "DFKI"
