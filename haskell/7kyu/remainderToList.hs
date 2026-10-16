module Kata where

solve :: [Int] -> Int -> [Int]
solve xs div = map (\x -> x + x `mod` div) xs
