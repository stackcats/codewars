module Multiples (multiples) where

multiples :: Int -> Int -> [Int]
multiples n limit = takeWhile (<= limit) [i * n | i <- [1 ..]]
