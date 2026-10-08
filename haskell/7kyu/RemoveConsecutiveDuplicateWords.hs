module RemoveConsecutiveDuplicateWords (remove) where

import Data.List

remove :: String -> String
remove = unwords . map head . group . words
