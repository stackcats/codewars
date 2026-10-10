module Codewars.Kata.SillyCASE where

import Data.Char

sillyCASE :: String -> String
sillyCASE xs = map toLower l ++ map toUpper r
 where
  size = length xs
  half = size `div` 2
  i = if even size then half else half + 1
  (l, r) = splitAt i xs
