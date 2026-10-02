module DominantElements where

solve :: [Int] -> [Int]
solve = foldr f []
 where
  f x [] = [x]
  f x rst@(y : ys)
    | x > y = x : rst
    | otherwise = rst
