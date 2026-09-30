module SumUniques (sumNoDuplicates) where

import Data.Bool
import Data.Map qualified as M

sumNoDuplicates :: [Int] -> Int
sumNoDuplicates xs = sum $ filter ((== 1) . (mp M.!)) xs
 where
  mp = foldl (\acc n -> M.insertWith (+) n 1 acc) M.empty xs
