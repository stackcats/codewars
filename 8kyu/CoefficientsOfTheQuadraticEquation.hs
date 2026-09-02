module CoefficientsOfTheQuadraticEquation (quadratic) where

quadratic :: Int -> Int -> (Int, Int, Int)
quadratic a b = (1, -a - b, a * b)
