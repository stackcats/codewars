module KthElement where

import Prelude hiding ((!!))

-- | Returns Just the k-th element of the list, or Nothing if k is out of bounds.
elementAt :: Int -> [a] -> Maybe a
elementAt k _
  | k < 1 = Nothing
elementAt _ [] = Nothing
elementAt 1 (x : xs) = Just x
elementAt n (x : xs) = elementAt (n - 1) xs
