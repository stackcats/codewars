module ComputeDepth where

import Data.List

computeDepth :: Int -> Int
computeDepth n = go 1 []
 where
  go d xs
    | sort xs == ['0' .. '9'] = d - 1
    | otherwise = go (succ d) (nub (show (n * d) <> xs))
