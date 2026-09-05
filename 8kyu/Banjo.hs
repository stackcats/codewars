module Banjo where

import Data.Char

areYouPlayingBanjo :: String -> String
areYouPlayingBanjo name
  | (toLower $ head name) == 'r' = name ++ " plays banjo"
  | otherwise = name ++ " does not play banjo"
