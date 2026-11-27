module PlentyOfFishInThePond.Kata (fish) where

import Data.Char
import Data.List

fish :: String -> Int
fish = go 1 0 . sort . map digitToInt
 where
  go size curr [] = size
  go size curr (x : xs)
    | size < x = size
    | next >= size * 4 = go (size + 1) (next - size * 4) xs
    | otherwise = go size next xs
   where
    next = curr + x
