module Codewars.Kata.PlayPass (playPass) where

import Data.Char

playPass :: String -> Int -> String
playPass s n = reverse . zipWith z [0 ..] . unwords . map (map (transform . toLower)) $ words s
 where
  transform c
    | c `elem` ['a' .. 'z'] = chr $ (ord c + n - ord 'a') `mod` 26 + ord 'a'
    | isDigit c = intToDigit $ (9 -) $ digitToInt c
    | otherwise = c

  z i c
    | odd i = toLower c
    | otherwise = toUpper c
