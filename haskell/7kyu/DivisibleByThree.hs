module DivisibleByThree where

import Data.Char

divisibleByThree :: String -> Bool
divisibleByThree = (== 0) . (`rem` 3) . sum . map digitToInt
