module Recaman (recaman) where

import Data.Set qualified as Set

recaman :: Int -> Int
recaman n = fst $ foldl f (0, Set.singleton 0) [1 .. n]
 where
  f (p, st) k
    | v < 0 || v `Set.member` st = (p + k, Set.insert (p + k) st)
    | otherwise = (v, Set.insert v st)
   where
    v = p - k
