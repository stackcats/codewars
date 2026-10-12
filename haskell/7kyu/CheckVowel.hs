module CheckVowel where

import Data.Char
import Data.List
import Data.Maybe

checkVowel :: String -> Int -> Bool
checkVowel xs i
  | i < 0 || i >= length xs = False
  | otherwise = (`elem` "aeiouAEIOU") $ xs !! i
