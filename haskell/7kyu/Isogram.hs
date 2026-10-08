module Isogram where

import Data.Char

isIsogram :: String -> Bool
isIsogram = f . map toUpper
 where
  f [] = True
  f (c : s)
    | c `elem` s = False
    | otherwise = f s
