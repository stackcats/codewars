module SingleDigit (singleDigit) where

import Data.Bits

singleDigit :: Integer -> Int
singleDigit n
  | n < 10 = fromIntegral n
  | otherwise = singleDigit $ fromIntegral $ popCount n
