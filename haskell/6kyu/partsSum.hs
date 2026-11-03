module Solution where

import Data.List

partsSum :: [Integer] -> [Integer]
partsSum [] = [0]
partsSum xs = reverse $ foldl (\acc x -> (head acc - x) : acc) [s] xs
 where
  s = sum xs
