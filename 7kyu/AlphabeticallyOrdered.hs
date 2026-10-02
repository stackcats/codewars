module AlphabeticallyOrdered where

import Data.List

alphabetic :: String -> Bool
alphabetic xs = xs == sort xs
