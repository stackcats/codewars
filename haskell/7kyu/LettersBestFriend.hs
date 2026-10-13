module LettersBestFriend (bestFriend) where

bestFriend :: String -> Char -> Char -> Bool
bestFriend [] a b = True
bestFriend (x : xs) a b
  | x /= a = bestFriend xs a b
  | null xs = False
  | head xs == b = bestFriend xs a b
  | otherwise = False
