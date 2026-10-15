module Codewars.Kata.SortedUnion where

import Data.List

uniteUnique :: (Ord a) => [[a]] -> [a]
uniteUnique = nub . concat
