module Codewars.Kata.LongestPalindrome where

longestPalindrome :: (Eq a) => [a] -> Int
longestPalindrome xs = max (go1 [] xs) (go2 [] xs)
 where
  go1 _ [] = 0
  go1 l (m : r) = max (len l r + 1) $ go1 (m : l) r

  go2 l (a : b : r)
    | a /= b = go2 (a : l) (b : r)
    | otherwise = max (len l r + 2) $ go2 (a : l) (b : r)
  go2 _ _ = 0
