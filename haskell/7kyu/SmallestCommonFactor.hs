module SmallestCommonFactor where

import Data.Set qualified as Set

scf :: [Int] -> Int
scf [] = 1
scf xs =
  case Set.lookupMin $ (1 `Set.delete`) $ foldl1 Set.intersection $ map factors xs of
    Just y -> y
    _ -> 1

factors n = Set.fromList $ concat [[i, n `div` i] | i <- [1 .. l], n `mod` i == 0]
 where
  l = ceiling $ sqrt $ fromIntegral n
