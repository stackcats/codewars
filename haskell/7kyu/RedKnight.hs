module RedKnight (redKnight) where

import Data.Bool

redKnight :: Int -> Int -> (String, Int)
redKnight = move 0

move kx ky x
  | x + 1 == nkx = (bool "Black" "White" (nky == 0), nkx)
  | otherwise = move nkx nky (x + 1)
 where
  nkx = kx + 2
  nky = (ky + 1) `mod` 2
