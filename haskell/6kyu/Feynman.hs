module Feynman where

countSquares :: Integer -> Integer
countSquares n = sum [(n - i + 1) ^ 2 | i <- [1 .. n]]
