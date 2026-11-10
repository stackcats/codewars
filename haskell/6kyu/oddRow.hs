module Solution where

oddRow :: Integer -> [Integer]
oddRow n = take (fromIntegral n) [m, m + 2 ..]
 where
  m = f n

f 1 = 1
f n = f (n - 1) + 2 * (n - 1)
