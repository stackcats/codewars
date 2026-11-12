module DuplicateArguments (solution) where

import Data.List

solution :: (Eq a, Ord a) => [a] -> Bool
solution = (/=) <*> nub
