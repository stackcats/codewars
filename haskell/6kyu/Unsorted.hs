module Unsorted where

import Data.Bits

findDup :: [Int] -> Int
findDup xs = foldl xor r [1 .. length xs - 1]
 where
  r = foldl xor 0 xs
