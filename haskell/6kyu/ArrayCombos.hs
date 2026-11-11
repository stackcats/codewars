module ArrayCombos where

import Data.List

solve :: [[Int]] -> Int
solve = product . map (length . nub)
