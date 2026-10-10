module Codewars.G964.Powofdigits where

import Data.Char

eqSumPowDig :: Int -> Int -> [Int]
eqSumPowDig hmax po = filter f [2 .. hmax]
 where
  f n = (== n) . sum . map ((^ po) . digitToInt) $ show n
