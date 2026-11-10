module Sort where

import Data.Char
import Data.List

sortme :: [String] -> [String]
sortme = sortOn (map toLower)
