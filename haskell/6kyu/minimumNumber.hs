module Solution.JorgeVS.Kata where

minimumNumber :: [Integer] -> Integer
minimumNumber xs = until isPrime succ t - t
 where
  t = sum xs

isPrime n
  | n < 2 = False
  | n == 2 = True
  | otherwise = all ((/= 0) . (n `mod`)) [2 .. ceiling $ sqrt $ fromIntegral $ n]
