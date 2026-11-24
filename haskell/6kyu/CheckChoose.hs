module Codewars.G964.CheckChoose where

checkchoose :: Integer -> Integer -> Integer
checkchoose m n =
  case take 1 [i | i <- [1 .. n], f n i == m] of
    [] -> -1
    (x : _) -> x

f n i = product [n - i + 1 .. n] `div` product [1 .. i]
