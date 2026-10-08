module Codewars.Kata.Multiply where

import Data.Function

multiply :: Integer -> Integer
multiply n = n * 5 ^ p
 where
  p = abs n & show & length
