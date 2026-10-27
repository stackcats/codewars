module Codewars.Kata.GCContent where

import Codewars.Kata.GCContent.Types

import Data.List

-- data Base = A | C | G | T deriving (Eq, Show, Enum, Bounded)

gcContent :: [Base] -> Double
gcContent [] = 0
gcContent xs = x * 100 / (genericLength xs)
 where
  x = genericLength $ filter ((||) <$> (== G) <*> (== C)) xs
