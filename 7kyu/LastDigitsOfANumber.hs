module LastDigitsOfANumber (lastDigits) where

import Data.Char

lastDigits :: Int -> Int -> [Int]
lastDigits n d
  | d <= 0 = []
  | otherwise = map digitToInt . reverse . take d . reverse $ show n
