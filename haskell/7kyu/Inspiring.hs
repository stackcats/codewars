module Inspiring (longestWord) where

longestWord :: String -> String
longestWord s = go "" xs
 where
  xs = words s
  go ans [] = ans
  go ans (x : xs)
    | length ans <= length x = go x xs
    | otherwise = go ans xs
