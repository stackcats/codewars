module Codewars.Kata.Product where

{- | Takes a square matrix and returns the product of all
  diagonal entries.
-}
mainDiagonalProduct :: (Num a) => [[a]] -> a
mainDiagonalProduct = product . zipWith (flip (!!)) [0 ..]
