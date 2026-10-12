module DigitsAverage where

import Data.Char

digitsAverage :: Int -> Int
digitsAverage = go . map digitToInt . show
 where
  go [x] = x
  go xs = go $ zipWith ((ceiling .) . ((/ 2) .) . (fromIntegral .) . (+)) xs $ drop 1 xs
