module ReverseWords where

reverseWords :: String -> String
reverseWords = unwords . reverse . words
