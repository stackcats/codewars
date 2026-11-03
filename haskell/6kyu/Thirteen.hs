module Codewars.G964.Thirteen where

import Data.Char

thirt :: Integer -> Integer
thirt n
  | n == m = n
  | otherwise = thirt m
 where
  m = sum $ zipWith (*) (cycle [1, 10, 9, 12, 3, 4]) (reverse . map (fromIntegral . digitToInt) $ show n)
