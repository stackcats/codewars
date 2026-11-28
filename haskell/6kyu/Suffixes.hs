module Codewars.Suffixes where

numberToOrdinal :: Int -> String
numberToOrdinal = (<>) <$> show <*> f

f n
  | n == 0 = ""
  | n `mod` 100 `elem` [11, 12, 13] = "th"
  | m == 1 = "st"
  | m == 2 = "nd"
  | m == 3 = "rd"
  | otherwise = "th"
 where
  m = n `mod` 10
