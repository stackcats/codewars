module Count where

import Data.List

countNumber :: Integer -> Integer -> Integer
countNumber n x = genericLength $ [i | i <- [1 .. n], i * n >= x, x `mod` i == 0]
