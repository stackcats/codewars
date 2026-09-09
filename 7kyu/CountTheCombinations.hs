module CountTheCombinations (numCombo) where

import Data.List

numCombo :: [Int] -> Int -> Int
numCombo xs n = length $ filter ((== n) . (total -)) xs
 where
  total = sum xs
