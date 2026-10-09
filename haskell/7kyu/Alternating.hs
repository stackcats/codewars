module Alternating (f) where

import Data.List

f :: (Eq a) => [a] -> a -> a
f xs x = xs !! ((i + 1) `mod` 3)
 where
  Just i = findIndex (== x) xs
