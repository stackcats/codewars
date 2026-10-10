module Codewars.Kata.ZipValidate where

import Data.Char

zipValidate :: String -> Bool
zipValidate code
  | length code /= 6 = False
  | head code `elem` "05789" = False
  | any (not . isDigit) code = False
  | otherwise = True
