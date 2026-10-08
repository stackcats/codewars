module Codewars.ConsonantCounter where

import Data.Char

consonantCount :: String -> Int
consonantCount = length . filter (`notElem` "aeiou") . map toLower . filter isAlpha
