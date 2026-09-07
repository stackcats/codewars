module SplitByValue (splitByValue) where

splitByValue :: Int -> [Int] -> [Int]
splitByValue k xs = lft ++ rht
 where
  lft = [n | n <- xs, n < k]
  rht = [n | n <- xs, n >= k]
