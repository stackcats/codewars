module Smallest where

import Data.List

firstNSmallest :: [Int] -> Int -> [Int]
firstNSmallest xs n = map snd . sortOn fst . take n . sortOn snd $ zip [0 ..] xs
