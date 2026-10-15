module Codewars.Kata.Catenation where

charConcat :: String -> String
charConcat word = concat $ zipWith3 (\a b c -> a : b : show c) l (reverse r) [1 ..]
 where
  (l, r) = splitAt (length word `div` 2) word
