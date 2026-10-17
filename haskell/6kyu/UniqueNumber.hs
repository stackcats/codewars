module CodeWars.UniqueNumber (getUnique) where

import Data.List

getUnique :: [Int] -> Int
getUnique (a : b : c : xs)
  | a == b && b == c = let Just x = find (/= a) xs in x
  | a == b = c
  | a == c = b
  | b == c = a
