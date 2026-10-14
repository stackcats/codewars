module Validation where

import Data.Bool
import Data.Char

validateEAN :: String -> Bool
validateEAN = (== 0) . (`mod` 10) . sum . zipWith (\i n -> bool (n * 3) n (even i)) [0 ..] . map digitToInt
