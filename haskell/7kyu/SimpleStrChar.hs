module SimpleStrChar where

import Data.Char

solve :: [Char] -> [Int]
solve = go [0, 0, 0, 0]
 where
  go ans [] = ans
  go [a, b, c, d] (x : xs)
    | isUpper x = go [a + 1, b, c, d] xs
    | isLower x = go [a, b + 1, c, d] xs
    | isDigit x = go [a, b, c + 1, d] xs
    | otherwise = go [a, b, c, d + 1] xs
