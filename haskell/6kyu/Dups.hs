module Dups where

import Data.Char
import Data.Map qualified as Map

duplicateEncode :: String -> String
duplicateEncode s = map (\c -> if mp Map.! (toLower c) > 1 then ')' else '(') s
 where
  mp = foldl (\mp x -> Map.insertWith (+) (toLower x) 1 mp) mempty s
