module Codewars.Kata.BackWardsPrime where

backwardsPrime :: Integer -> Integer -> [Integer]
backwardsPrime = (filter isDPrime .) . enumFromTo

isDPrime n = isPrime n && m /= n && isPrime m
 where
  m = rev n

rev :: Integer -> Integer
rev = foldl1 (\acc x -> acc * 10 + x) . map (\x -> read [x]) . reverse . show

isPrime n
  | n < 2 = False
  | n == 2 = True
  | otherwise = all ((/= 0) . (n `mod`)) [2 .. ceiling $ sqrt $ fromIntegral n]
