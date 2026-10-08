module SumOfCubes where

sumCubes :: Integer -> Integer
sumCubes = sum . map (^ 3) . enumFromTo 1
