module Codewars.Kata.Compound where

compoundArray :: [a] -> [a] -> [a]
compoundArray [] [] = []
compoundArray xs [] = xs
compoundArray [] ys = ys
compoundArray (x : xs) (y : ys) = x : y : compoundArray xs ys
