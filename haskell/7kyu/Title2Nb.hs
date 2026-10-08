module Codewars.G964.Title2Nb where

import Data.Char

titleToNb :: String -> Integer
titleToNb = foldl (\acc c -> acc * 26 + f c) 0

f c = toInteger $ ord c - ord 'A' + 1
