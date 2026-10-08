module Swap where

firstReverseTry :: [Int] -> [Int]
firstReverseTry [] = []
firstReverseTry [x] = [x]
firstReverseTry lst = last xs : (init xs) ++ [x]
 where
  (x : xs) = lst
