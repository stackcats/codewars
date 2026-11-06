module Kata (longestRepetition) where

import Data.Function
import Data.List

longestRepetition :: String -> Maybe (Char, Int)
longestRepetition [] = Nothing
longestRepetition s = (\xs -> Just (head xs, length xs)) . maximumBy (compare `on` length) . reverse $ group s
