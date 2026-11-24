module AddedChar where

import Data.List

addedChar :: String -> String -> Char
addedChar = (.) (head . nub) . flip (\\)
