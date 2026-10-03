module Kata (filterWords) where

import Data.Char

filterWords :: String -> String
filterWords = cap . unwords . words . map toLower

cap (c : s) = toUpper c : s
