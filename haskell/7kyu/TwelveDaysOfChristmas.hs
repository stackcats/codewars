module TwelveDaysOfChristmas (comparator) where

import Data.List
import Data.Maybe

lst = ["On"] ++ map show [12, 11 .. 2] ++ ["a"]

comparator :: String -> String -> Ordering
comparator a b = compare (f x lst) (f y lst)
 where
  x = head $ words a
  y = head $ words b
  f s = fromJust . findIndex (== s)
