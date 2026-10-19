module Codewars.ArraySort (sortArray) where

import Data.List

sortArray :: [a] -> [Int] -> [a]
sortArray = (map fst .) . (sortOn snd .) . zip
