module OddBit (anyOdd) where

import Data.Bool
import Data.Word (Word32)
import Text.Printf

anyOdd :: Word32 -> Int
anyOdd = bool 1 0 . null . filter (\(i, b) -> odd i && b == '1') . zip [0 ..] . reverse . printf "%b"
