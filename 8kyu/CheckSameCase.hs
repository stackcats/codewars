module CheckSameCase (sameCase) where

import Data.Char

sameCase :: Char -> Char -> Int
sameCase a b
        | not (isLetter a) || not (isLetter b) = -1
        | isLower a && isLower b = 1
        | isUpper a && isUpper b = 1
        | otherwise = 0
