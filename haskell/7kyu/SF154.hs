module SF154 (zeroAndOne) where

zeroAndOne :: String -> Int
zeroAndOne (a : b : xs)
  | a /= b = zeroAndOne xs
  | otherwise = 1 + zeroAndOne (b : xs)
zeroAndOne xs = length xs
