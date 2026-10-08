module Fix where

import Data.Char
import Data.List
import Data.List.Split

fix' :: String -> String
fix' = intercalate ". " . map cap . splitOn ". "

cap (x : xs) = toUpper x : xs
cap s = s
