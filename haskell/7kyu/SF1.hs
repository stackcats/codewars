module SF1 where

import Data.List

arrayPreviousLess :: [Int] -> [Int]
arrayPreviousLess = reverse . fst . foldl f ([], [])
 where
  f (acc, prev) n =
    case find (< n) prev of
      Just x -> (x : acc, n : prev)
      Nothing -> (-1 : acc, n : prev)
