module Codewars.Exercise.AlphaN where

import Data.Char
import Data.List
import Data.Ord

sortIt :: [String] -> Int -> [String]
sortIt xs n = sortBy (comparing (\w -> let u = map toLower w in (u !! (n - 1), u))) xs
