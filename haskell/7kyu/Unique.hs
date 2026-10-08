module Codewars.Kata.Unique where

import Data.List

hasUniqueChar :: String -> Bool
hasUniqueChar str = str == nub str
