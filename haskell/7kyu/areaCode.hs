module Kata (areaCode) where

import Data.List

areaCode :: String -> String
areaCode = init . drop 1 . dropWhileEnd (/= ')') . dropWhile (/= '(')
