module Kata (wordsToMarks) where

import Data.Char

base = ord 'a' - 1

wordsToMarks :: String -> Int
wordsToMarks = sum . map (subtract base . ord)
