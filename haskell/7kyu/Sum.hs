module Sum where

f :: Int -> [Integer]
f n = map (2 ^) [0 .. n] ++ [2 ^ (n + 1) - 1]
