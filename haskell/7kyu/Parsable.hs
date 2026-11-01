module Parsable where

import Data.Char

parses :: String -> Bool
parses "" = False
parses "-" = False
parses ('-' : xs) = all isDigit xs
parses xs = all isDigit xs
