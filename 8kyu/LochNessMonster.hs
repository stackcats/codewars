module LochNessMonster where

import Data.List (isInfixOf)

isLochNessMonster :: String -> Bool
isLochNessMonster xs = any (\x -> isInfixOf x xs) ["tree fiddy", "3.50", "three fifty"]
