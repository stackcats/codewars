module Caeser where

import Data.Char

caeser :: String -> Int -> String
caeser s k = map (\c -> if isAlpha c then encode c k else c) s

encode :: Char -> Int -> Char
encode c k
  | c >= 'a' && c <= 'z' = chr $ (ord c - ord 'a' + safeK) `mod` 26 + ord 'A'
  | c >= 'A' && c <= 'Z' = chr $ (ord c - ord 'A' + safeK) `mod` 26 + ord 'A'
  | otherwise            = toUpper c
  where
    safeK = k `mod` 26
