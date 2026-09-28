module SumStrings where

import Data.Char
import Data.List.Split

sumOfIntegersInString :: [Char] -> Int
sumOfIntegersInString = sum . map read . filter (not . null) . wordsBy (not . isDigit)
