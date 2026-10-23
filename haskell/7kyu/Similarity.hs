module Similarity where

import Data.Set qualified as Set

similarity :: ([Int], [Int]) -> Double
similarity (a, b) = fromIntegral (Set.size i) / fromIntegral (Set.size u)
 where
  sa = Set.fromList a
  sb = Set.fromList b
  i = Set.intersection sa sb
  u = Set.union sa sb
