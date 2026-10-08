module Shape where

shapeArea :: Int -> Int
shapeArea n = (subtract (2 * n - 1)) . (* 2) . sum $ take n [1, 3 ..]
