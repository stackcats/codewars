module Codewars.Kata.Filter where

import Data.Char

filterString :: String -> Int
filterString = read . filter isDigit
