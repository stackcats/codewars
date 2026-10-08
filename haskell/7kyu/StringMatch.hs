module StringMatch where

import Data.Map qualified as Map
import Data.Maybe

solve :: [String] -> [String] -> [Int]
solve xs = map (fromMaybe 0 . (`Map.lookup` mp))
 where
  mp = foldl (\acc s -> Map.insertWith (+) s 1 acc) Map.empty xs
