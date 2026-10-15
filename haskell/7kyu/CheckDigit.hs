module CheckDigit where

import Data.Char
import Data.List

checkDigit :: Int -> Int -> Int -> Int -> Bool
checkDigit number index1 index2 = (`elem` xs)
 where
  [start, end] = sort [index1, index2]
  xs = map digitToInt . drop start . take (succ end) $ show number
