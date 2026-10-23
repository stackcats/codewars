module ElectionWinners where

import Data.List
import Data.Ord

electionWinners :: [Int] -> Int -> Int
electionWinners xs n
  | n == 0 && ma > ys !! 1 = 1
  | n == 0 = 0
  | otherwise = length $ takeWhile ((> ma) . (+ n)) ys
 where
  ys = sortOn Down xs
  ma = head ys
