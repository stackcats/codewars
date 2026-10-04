module Codewars.Exercise.Scrabble where

import Codewars.Exercise.Scrabble.Score (dict)

import Data.Char
import Data.Maybe

-- dict :: [(Char, Int)]
-- Contains only uppercase letters and their score
scrabbleScore :: String -> Int
scrabbleScore = sum . map (fromMaybe 0 . (`lookup` dict) . toUpper)
