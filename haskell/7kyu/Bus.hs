module Codewars.Kata.Bus where

number :: [(Int, Int)] -> Int
number = foldl (\acc (a, b) -> acc + a - b) 0
