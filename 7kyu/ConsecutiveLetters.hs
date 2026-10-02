module ConsecutiveLetters where

import Data.List

solve :: String -> Bool
solve xs = nub xs == xs && sort xs == take (length xs) [minimum xs ..]
