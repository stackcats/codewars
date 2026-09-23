module MostCommonLetter where

import Data.Bool
import Data.List
import Data.Map qualified as Map

replaceCommon :: String -> Char -> String
replaceCommon string letter = map (\c -> bool c letter (c == t)) string
 where
  mp = foldl (\acc c -> Map.insertWith (+) c 1 acc) Map.empty $ filter (/= ' ') string
  ma = Map.foldl max 0 mp
  (Just t) = find (\c -> Map.lookup c mp == (Just ma)) string
