module EvenLast (evenLast) where

import Data.List.Split

evenLast :: [Int] -> Int
evenLast [] = 0
evenLast xs = (* n) $ sum $ map head $ chunksOf 2 xs
 where
  n = last xs
