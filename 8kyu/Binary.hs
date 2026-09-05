module Binary where

import Data.Function

toBinary :: Integer -> Integer
toBinary 0 = 0
toBinary n = f n & reverse & foldl1 (\acc x -> acc * 10 + x)

f 0 = []
f n = n `rem` 2 : f (n `div` 2)
