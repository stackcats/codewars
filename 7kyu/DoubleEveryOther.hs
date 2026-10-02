module Codewars.Kata.DoubleEveryOther (doubleEveryOther) where

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (a : b : xs) = a : (b * 2) : doubleEveryOther xs
doubleEveryOther xs = xs
