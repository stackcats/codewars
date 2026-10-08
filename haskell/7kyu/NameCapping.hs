module Codwars.Kata.NameCapping where

import Data.Char

capMe :: [String] -> [String]
capMe = map f
 where
  f "" = ""
  f (x : xs) = toUpper x : map toLower xs
