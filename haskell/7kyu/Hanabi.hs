module Hanabi where

import Preloaded (Suit (..))

import Data.List

ways :: [(Int, Suit)] -> Int
ways hand = length xs + length ys
 where
  xs = nub $ map fst hand
  ys = nub $ map snd hand
