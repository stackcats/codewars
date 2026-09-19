module Kata (mean) where

import Data.Char
import Data.List

mean :: [Char] -> (Double, String)
mean lst =
  let (a, b) = partition isNumber lst
   in ((sum $ map (\x -> read [x]) a) / (fromIntegral $ length a), b)
