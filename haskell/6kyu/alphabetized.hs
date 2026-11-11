module Alphabetized.Kata (alphabetized) where

import Data.Char
import Data.List

alphabetized :: String -> String
alphabetized = sortOn toLower . filter isAlpha
