module DeltaBits (convertBits) where

import Data.Bits

convertBits :: Int -> Int -> Int
convertBits = (popCount .) . xor
