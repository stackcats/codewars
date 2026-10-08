module BitsBattle (bitsBattle) where

import Data.Bits
import Data.List

bitsBattle :: [Word] -> String
bitsBattle xs =
  case compare a b of
    LT -> "evens win"
    GT -> "odds win"
    _ -> "tie"
 where
  (l, r) = partition odd xs
  a = sum $ map popCount l
  b = sum $ map zeroCount r

zeroCount 0 = 0
zeroCount n
  | even n = 1 + zeroCount (n `div` 2)
  | otherwise = zeroCount (n `div` 2)
