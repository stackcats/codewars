module Kata where

import Data.Char
import Data.List
import Data.List.Split

fizzBuzzCuckooClock :: String -> String
fizzBuzzCuckooClock time
  | m == "30" = "Cuckoo"
  | m == "00" = unwords $ replicate h' "Cuckoo"
  | m' `mod` 15 == 0 = "Fizz Buzz"
  | m' `mod` 3 == 0 = "Fizz"
  | m' `mod` 5 == 0 = "Buzz"
  | otherwise = "tick"
 where
  [h, m] = splitOn ":" time
  m' = toInt m
  h' = let tmp = toInt h `mod` 12 in if tmp == 0 then 12 else tmp

toInt [a, b] = digitToInt a * 10 + digitToInt b
