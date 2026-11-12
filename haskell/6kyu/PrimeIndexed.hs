module PrimeIndexed where

total :: [Int] -> Int
total = sum . concat . zipWith (\i x -> if isPrime i then [x] else []) [0 ..]

isPrime n
  | n < 2 = False
  | n == 2 = True
  | otherwise = all ((/= 0) . (n `mod`)) [2 .. ceiling $ sqrt $ fromIntegral n]
