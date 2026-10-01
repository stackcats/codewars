module Kata (tailSwap) where

import Data.List.Split

tailSwap :: (String, String) -> (String, String)
tailSwap (x, y) =
  let [a, b] = splitOn ":" x
      [c, d] = splitOn ":" y
   in (a ++ ":" ++ d, c ++ ":" ++ b)
