module MultiplicationTable where

multiplicationTable :: Int -> [[Int]]
multiplicationTable n = take n $ iterate (zipWith (+) [1 .. n]) [1 .. n]
