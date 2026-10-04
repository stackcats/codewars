module PonyExpress where

riders :: [Int] -> Int
riders = go 100

go n [] = 1
go n (x : xs)
  | n >= x = go (n - x) xs
  | otherwise = 1 + go (100 - x) xs
