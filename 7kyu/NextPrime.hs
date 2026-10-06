module Codewars.NextPrime where

nextPrime :: Integer -> Integer
nextPrime n = head [m | m <- [n + 1 ..], isPrime m]

isPrime 2 = True
isPrime n = all ((/= 0) . (n `mod`)) [2 .. m]
 where
  m = ceiling $ sqrt $ fromIntegral n
