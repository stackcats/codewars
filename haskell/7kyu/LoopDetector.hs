module LoopDetector (hasLoop) where

import Data.Set qualified as Set

hasLoop :: [Int] -> Bool
hasLoop [] = False
hasLoop xs = go mempty (head xs)
 where
  go st i
    | i `Set.member` st = True
    | i >= length xs = False
    | otherwise = go (Set.insert i st) (xs !! i)
