module Kata (seaSick) where

import Data.List

seaSick :: String -> String
seaSick sea
  | x > 0.2 * genericLength sea = "Throw Up"
  | otherwise = "No Problem"
 where
  x = genericLength $ filter (uncurry (/=)) $ zip sea $ drop 1 sea
