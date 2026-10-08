module Wheat where

squaresNeeded :: Int -> Int
squaresNeeded = ceiling . logBase 2 . fromIntegral . succ
