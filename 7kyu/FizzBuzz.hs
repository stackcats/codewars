module FizzBuzz (fizzbuzz) where

fizzbuzz :: Int -> [String]
fizzbuzz n = [f i | i <- [1 .. n]]
 where
  f n
    | n `mod` 15 == 0 = "FizzBuzz"
    | n `mod` 3 == 0 = "Fizz"
    | n `mod` 5 == 0 = "Buzz"
    | otherwise = show n
