module Kata.BinaryString (binStr) where

binStr :: String -> Int
binStr = go 0
 where
  go ct [] = ct
  go ct (x : xs)
    | even ct && x == '1' = go (succ ct) xs
    | odd ct && x == '0' = go (succ ct) xs
    | otherwise = go ct xs
