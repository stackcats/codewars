module Plant where

plantDoubling :: Int -> Int
plantDoubling n
  | 2 ^ m == n = 1
  | otherwise = plantDoubling (n - 2 ^ m) + 1
 where
  m = floor $ logBase 2 $ fromIntegral n
