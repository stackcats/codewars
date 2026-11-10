module Kata.AreWeAlternate (isAlt) where

import Data.List.Split

isAlt :: String -> Bool
isAlt = all (\[a, b] -> (a `elem` "aeiou") /= (b `elem` "aeiou")) . divvy 2 1
