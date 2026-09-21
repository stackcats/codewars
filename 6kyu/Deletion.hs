module Codewars.Kata.Deletion where

import Data.Map qualified as Map
import Data.Maybe

deleteNth :: [Int] -> Int -> [Int]
deleteNth lst n = reverse $ fst $ foldl f ([], Map.empty) lst
 where
  f (xs, mp) x =
    if fromMaybe 0 (Map.lookup x mp) < n
      then (x : xs, Map.insertWith (+) x 1 mp)
      else (xs, mp)
