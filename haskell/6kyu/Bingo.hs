module Bingo where

import Data.Char

bingo :: [(String, Int)] -> Int -> String
bingo xs n
  | (length $ filter (>= 1) $ map f xs) >= n = "Winner!"
  | otherwise = "Loser!"
 where
  f (s, n) = length $ filter (== (chr n)) s
