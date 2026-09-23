module Codewars.G964.Validateword where

import Data.Char
import Data.List

validateWord :: String -> Bool
validateWord = (== 1) . length . group . map length . group . sort . map toUpper
