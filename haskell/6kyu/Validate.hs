module Validate where

import Data.Char

validate :: Integer -> Bool
validate = (== 0) . (`mod` 10) . sum . zipWith f [0 ..] . map digitToInt . reverse . show
 where
  f i n
    | odd i && m > 9 = m - 9
    | odd i = m
    | otherwise = n
   where
    m = 2 * n
