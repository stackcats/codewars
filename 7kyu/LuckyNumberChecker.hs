module Codewars.LuckyNumberChecker where

import Data.Char

isLucky :: Integer -> Bool
isLucky 0 = True
isLucky n = (== 0) . (`rem` 9) . sum . map digitToInt $ show n
