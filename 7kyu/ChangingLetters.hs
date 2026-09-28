module ChangingLetters (swap) where

import Data.Bool
import Data.Char

swap :: String -> String
swap = map (\c -> bool c (toUpper c) (c `elem` "aeiou"))
