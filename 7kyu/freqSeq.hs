module Kata (freqSeq) where

import Data.List
import Data.Map qualified as Map
import Data.Maybe

freqSeq :: String -> Char -> String
freqSeq str sep = intersperse sep $ concatMap (show . fromMaybe 0 . (`Map.lookup` mp)) str
 where
  mp = foldl (\mp c -> Map.insertWith (+) c 1 mp) Map.empty str
