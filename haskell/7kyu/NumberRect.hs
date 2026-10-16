module NumberRect where

numberOfRectangles :: Int -> Int -> Int
numberOfRectangles m n = sum [a * b | a <- [1 .. m], b <- [1 .. n]]
