module OnesAndZeroes (sameLength) where

import Data.List
import Data.List.Split

sameLength :: String -> Bool
sameLength s
  | head s == '0' = False
  | odd (length xs) = False
  | otherwise = all f $ divvy 2 2 xs
 where
  xs = group s
  f [a, b] = head a == '1' && head b == '0' && length a == length b
