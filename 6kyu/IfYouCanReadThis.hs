module Codewars.Kata.IfYouCanReadThis (toNato) where

import Codewars.Kata.IfYouCanReadThis.Preload (nato)

import Data.Map.Strict ((!))

import Data.Bool
import Data.Char
import Data.List

-- nato ! 'A' == 'Alfa'
toNato :: String -> String
toNato = intercalate " " . map (\c -> bool [c] (nato ! c) (isLetter c)) . map toUpper . filter (not . isSpace)
