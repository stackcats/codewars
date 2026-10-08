module MultipleOfIdx where

import Data.Function

multipleOfIndex :: [Int] -> [Int]
multipleOfIndex xs =
  drop 1 xs
    & zip [1 ..]
    & filter (\(i, n) -> n `mod` i == 0)
    & map snd
