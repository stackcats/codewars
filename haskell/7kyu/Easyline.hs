module Codewars.Kata.Easyline where

easyLine :: Integer -> Integer
easyLine n = product [n + 1 .. 2 * n] `div` product [1 .. n]
