module AlphabetProduct (alphabet) where

import Data.List

alphabet :: [Int] -> Int
alphabet xs = head $ [d | [a, b, c, d, ab, bc, cd, da] <- permutations xs, a < b, b < c, c < d, a * b == ab, b * c == bc, c * d == cd, d * a == da]
