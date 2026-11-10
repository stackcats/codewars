module PermutePalindrome (permutePalindrome) where

import Data.List

permutePalindrome :: String -> Bool
permutePalindrome = (< 2) . length . filter (odd . length) . group . sort
