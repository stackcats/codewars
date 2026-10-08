module SimpleEqRev where

import Data.Char
import Data.List

solve :: String -> String
solve = (intercalate "") . reverse . groupBy (\a b -> isDigit a && isDigit b)
