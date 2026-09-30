module Bingo.Kata (bingo) where

import Data.Bool
import Data.Char
import Data.List

bingo :: [Int] -> String
bingo = bool "LOSE" "WIN" . (== xs) . intersect xs
 where
  xs = map (\c -> ord c - ord 'A' + 1) "BINGO"
