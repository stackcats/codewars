module Kata where

import Data.Char

highestValue :: String -> String -> String
highestValue a b
  | worth a >= worth b = a
  | otherwise = b
 where
  worth = sum . map ord
