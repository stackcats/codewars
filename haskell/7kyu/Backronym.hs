module Codewars.Exercise.Backronym where

import Codewars.Exercise.Backronym.Dictionary (dict)

-- dict :: Char -> String
-- Can only map uppercase letters.

import Data.Char

makeBackronym :: String -> String
makeBackronym = unwords . map (dict . toUpper)
