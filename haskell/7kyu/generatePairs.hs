module Kata (generatePairs) where

generatePairs :: Int -> [[Int]]
generatePairs n = [[a, b] | a <- [0 .. n], b <- [a .. n]]
