module SortNums where

import Data.List

sortNumbers :: [Int] -> Maybe [Int]
sortNumbers [] = Nothing
sortNumbers xs = Just $ sort xs
