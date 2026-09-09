module LongestConsecutiveSequenceOfSquares.Kata (longestSequence) where

longestSequence :: Integer -> [Integer]
longestSequence n = f 1 1 0
 where
  f l r s
    | s == n = [l .. r - 1]
    | s < n = f l (r + 1) (s + r ^ 2)
    | l ^ 2 < n = f (l + 1) r (s - l ^ 2)
    | otherwise = []
