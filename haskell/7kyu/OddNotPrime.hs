module OddNotPrime where

oddNotPrime :: Int -> Int
oddNotPrime n = length [i | i <- [1, 3 .. n], not $ isPrime i]

isPrime n
  | n < 2 = False
  | n == 2 = True
  | otherwise = all (\i -> n `mod` i /= 0) [2 .. ceiling $ sqrt $ fromIntegral n]
