module CamelCase.JorgeVS.Kata where

import Data.Char

camelCase :: String -> String
camelCase = foldl1 (++) . map caps . words

caps (s : ss) = toUpper s : ss
