module Palindrome where

palindrome :: Int -> Int -> Maybe [Int]
palindrome n s
  | n < 0 || s < 0 = Nothing
  | otherwise = Just $ take s $ filter isPal $ iterate succ n

isPal n
  | n < 10 = False
  | otherwise = reverse m == m
 where
  m = show n
