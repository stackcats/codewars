module IdenticalElements (duplicateElements) where

import Data.Set qualified as Set

duplicateElements :: [Int] -> [Int] -> Bool
duplicateElements xs ys = any (`Set.member` st) ys
 where
  st = Set.fromList xs
