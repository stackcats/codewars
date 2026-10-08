module Kata.WaveSort (waveSort) where

import Data.List (sort)

waveSort :: (Ord x) => [x] -> [x]
waveSort = wave . sort

wave :: [x] -> [x]
wave (a : b : xs) = b : a : wave xs
wave xs = xs
