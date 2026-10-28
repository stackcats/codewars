module Piles where

import Data.Maybe

fourPiles :: Int -> Int -> Maybe (Int, Int, Int, Int)
fourPiles n y = listToMaybe [(x+y, x-y, x*y, x `div` y) | x <- [1..n], x `mod` y == 0, x /= y, 2 * x + x * y + x `div` y == n]
