module Codewars.Kata.Derivative where

derive :: Int -> Int -> String
derive a b = show (a * b) ++ "x^" ++ show (b - 1)
