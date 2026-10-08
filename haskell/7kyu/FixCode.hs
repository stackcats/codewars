module FixCode where

import Data.Char
import Data.Function

solve :: [Char] -> Bool
solve xs = all (\(a, b) -> (ord a - ord b) `elem` [-2, 0, 2]) $ zip xs $ reverse xs
