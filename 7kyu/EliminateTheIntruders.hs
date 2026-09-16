module EliminateTheIntruders (eliminateUnsetBits) where

import Data.Char

eliminateUnsetBits :: String -> Integer
eliminateUnsetBits = foldl (\acc c -> acc * 2 + (toInteger $ digitToInt c)) 0 . filter (== '1')
