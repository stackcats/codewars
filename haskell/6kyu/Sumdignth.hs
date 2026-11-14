module Codewars.G964.Sumdignth where

import Data.Char

sumDigNthTerm :: Int -> [Int] -> Int -> Int
sumDigNthTerm initval patternl nthterm = go initval nthterm (cycle patternl)
 where
  go x 1 _ = sum . map digitToInt $ show x
  go x i ps = go (x + head ps) (i - 1) (tail ps)
