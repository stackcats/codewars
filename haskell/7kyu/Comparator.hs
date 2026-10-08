module Codewars.Kata.Comparator where

import Data.List

matchList :: (Eq a) => [a] -> [a] -> Int
matchList = (length .) . intersect
