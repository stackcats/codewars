module IsPrime where

isPrime :: Integer -> Bool
isPrime x
  | x < 2 = False
  | x == 2 = True
  | otherwise = all ((/= 0) . (x `mod`)) [2 .. ceiling $ sqrt $ fromIntegral x]
