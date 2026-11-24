module Codewars.Kata.Choose1 (diagonal) where

diagonal :: Integer -> Integer -> Integer
diagonal n p = f (n + 1) (p + 1)

-- https://en.wikipedia.org/wiki/Hockey-stick_identity
f n i = product [n - i + 1 .. n] `div` product [1..i]
