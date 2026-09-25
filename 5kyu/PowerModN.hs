module PowerModN (modPow) where

modPow :: Integer -> Integer -> Integer -> Integer
modPow x y m = go 1 x y
 where
  go ans _ 0 = ans
  go ans x y
    | odd y = go (ans * x `mod` m) x (y - 1)
    | otherwise = go ans (x * x `mod` m) (y `div` 2)
