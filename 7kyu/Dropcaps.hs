module Codewars.Exercise.Dropcaps where

import Data.Char
import Data.List.Split

dropCap :: String -> String
dropCap = unwords . map cap . splitOn " "
 where
  cap s@(x : xs)
    | length s <= 2 = s
    | otherwise = toUpper x : map toLower xs
  cap s = s
