module NumberZoo (findMissingNumber) where

import Data.List

findMissingNumber :: [Int] -> Int
findMissingNumber xs =
  case dropWhile (uncurry (==)) . zip [1 ..] $ sort xs of
    [] -> length xs + 1
    (x, _) : _ -> x
