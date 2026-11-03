module ReverseEveryOtherWord (reverseEveryOther) where

import Data.List.Split

reverseEveryOther :: String -> String
reverseEveryOther = unwords . concatMap f . chunksOf 2 . words
 where
  f [a, b] = [a, reverse b]
  f xs = xs
