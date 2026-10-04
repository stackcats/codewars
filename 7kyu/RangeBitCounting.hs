module RangeBitCounting (rangeBitCount) where

import Data.Bits

rangeBitCount :: Int -> Int -> Int
rangeBitCount a b = sum $ map popCount [a .. b]
