module DistinctDigitYear where

import Data.List

distinctDigitYear :: Int -> Int
distinctDigitYear = until ((nub >>= (==)) . show) succ . succ
