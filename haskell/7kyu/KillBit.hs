module KillBit where

import Data.Bits

killKthBit :: Int -> Int -> Int
killKthBit n k = clearBit n (k - 1)
