module Codewars.Kata.Collatz where

import Data.Bool

collatz :: Integer -> Int
collatz 1 = 1
collatz n
  | even n = succ $ collatz $ n `div` 2
  | otherwise = succ $ collatz $ n * 3 + 1
