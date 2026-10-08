module LargestPairSum (largestPairSum) where

import Data.List
import Data.Ord

largestPairSum :: (Integral a) => [a] -> a
largestPairSum = sum . take 2 . sortOn Down
