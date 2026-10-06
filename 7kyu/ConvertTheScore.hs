module ConvertTheScore (scoreboard) where

import Data.List
import Data.Maybe

lst = ["nil", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

scoreboard :: String -> (Int, Int)
scoreboard s =
  let [a, b] = mapMaybe (`elemIndex` lst) $ words s
   in (a, b)
