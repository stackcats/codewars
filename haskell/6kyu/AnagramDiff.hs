module AnagramDiff where

import Data.List

anagramDifference :: String -> String -> Int
anagramDifference xs ys = length (xs \\ ys) + length (ys \\ xs)
