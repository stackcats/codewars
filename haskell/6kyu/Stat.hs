module Codewars.G964.Stat where

import Data.List
import Data.List.Split
import Text.Printf

stat :: String -> String
stat "" = ""
stat s = printf "Range: %s Average: %s Median: %s" range mean median
 where
  xs = sort $ map (foldl1 (\a x -> a * 60 + x) . map read . splitOn "|") $ splitOn ", " s
  toS :: Int -> String
  toS x = printf "%02d|%02d|%02d" (x `div` 3600) (x `div` 60 `mod` 60) (x `mod` 60)
  range = toS $ last xs - head xs
  mean = toS $ floor $ (fromIntegral $ sum xs) / (genericLength xs)
  median
    | even (length xs) = toS $ (last l + head r) `div` 2
    | otherwise = toS $ head r
   where
    (l, r) = splitAt (length xs `div` 2) xs
