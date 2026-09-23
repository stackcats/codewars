module Multiples where

import Data.Function
import Data.List

findLowestInt :: Int -> Int
findLowestInt k = head [n | n <- [1 ..], f (n * k) (n * (k + 1))]
 where
  f a b = ((==) `on` (sort . show)) a b
