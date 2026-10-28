module Sliding where

import Data.List.Split

sliding :: [Int] -> Int -> [Int]
sliding xs k = map maximum $ divvy k 1 xs
