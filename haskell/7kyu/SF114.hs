module SF114 where

import Data.Char

abacaba :: Int -> Char
abacaba k
  | diff == 0 = chr $ ord 'a' + n
  | otherwise = abacaba diff
 where
  n = floor $ logBase 2 $ fromIntegral k
  diff = k - 2 ^ n
