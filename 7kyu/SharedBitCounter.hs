module SharedBitCounter (sharedBits) where

import Data.Bits

sharedBits :: Int -> Int -> Bool
sharedBits = ((> 1) .) . (popCount .) . (.&.)
