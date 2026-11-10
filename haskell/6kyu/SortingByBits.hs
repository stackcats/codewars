module SortingByBits (sortByBit) where

import Data.Bits
import Data.List
import Data.Ord
import Data.Word (Word32)

sortByBit :: [Word32] -> [Word32]
sortByBit = sortBy (comparing popCount <> comparing id)
