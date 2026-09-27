module Kata where

import Data.Bool
import Data.Char

import Data.Set qualified as Set

capitalize :: String -> [Int] -> String
capitalize s xs = map f $ zip s [0 ..]
 where
  st = Set.fromList xs
  f (c, i) = bool c (toUpper c) (Set.member i st)
