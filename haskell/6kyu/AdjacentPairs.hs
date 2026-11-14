module AdjacentPairs where

import Data.Char
import Data.List

countAdjacentPairs :: String -> Int
countAdjacentPairs = length . filter (> 1) . map length . group . words . map toLower
