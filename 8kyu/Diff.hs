module Diff where

import Data.List (sortOn)
import Data.Ord (Down (..))

sumOfDifferences :: [Int] -> Maybe Int
sumOfDifferences [] = Nothing
sumOfDifferences [_] = Nothing
sumOfDifferences xs = Just $ maximum xs - minimum xs
