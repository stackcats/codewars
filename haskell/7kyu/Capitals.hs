module Codewars.Kata.Capitals where

import Data.Char

capitals :: String -> [Int]
capitals = concatMap (\(i, c) -> if isUpper c then [i] else []) . zip [0 ..]
