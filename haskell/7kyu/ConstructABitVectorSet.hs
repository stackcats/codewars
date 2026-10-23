module ConstructABitVectorSet (sortByBit) where

import Data.Bits

sortByBit :: [Int] -> Int
sortByBit = foldl (\acc i -> (1 `shiftL` i) .|. acc) 0
