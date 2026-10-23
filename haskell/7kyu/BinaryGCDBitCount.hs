module BinaryGCDBitCount where

import Data.Bits

binaryGCD :: Int -> Int -> Int
binaryGCD = (popCount .) . gcd
