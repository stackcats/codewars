module ApproxRoot where

-- no rounding, just compares ~0.01 accuracy

approxRoot :: Int -> Double
approxRoot n
  | a * a == m = a
  | otherwise = a + (m - a * a) / (b * b - a * a)
 where
  m :: Double
  m = fromIntegral n
  a = fromIntegral $ floor $ sqrt $ m
  b = fromIntegral $ ceiling $ sqrt $ m
