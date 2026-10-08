module FindArray (findArray) where

import Data.List

findArray :: [a] -> [Int] -> [a]
findArray arr1 = map (arr1 !!) . filter ((&&) <$> (< size) <*> (>= 0))
 where
  size = length arr1
