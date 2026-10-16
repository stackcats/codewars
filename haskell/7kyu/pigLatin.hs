module Kata (pigLatin) where

pigLatin :: String -> String
pigLatin = unwords . map f . words
 where
  f w
    | length w > 3 = drop 1 w ++ take 1 w ++ "ay"
    | otherwise = w
