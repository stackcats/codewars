module Duplicates where

import Data.List

countDuplicates :: [String] -> [Int] -> [Int] -> Int
countDuplicates = (((sum . map (pred . length) . group . sort) .) .) . zip3
