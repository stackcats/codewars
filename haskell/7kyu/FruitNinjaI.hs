module FruitNinjaI where

import Data.List

import Fruits

-- defines fruits :: [String]

cutFruits :: [String] -> [String]
cutFruits = concatMap f
 where
  f s
    | s `elem` fruits = let (l, r) = splitAt (ceiling $ genericLength s / 2) s in [l, r]
    | otherwise = [s]
