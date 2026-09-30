module Move10 where

import Data.Char

move10 :: String -> String
move10 = map (chr . (+ 97) . (`mod` 26) . (+ 10) . (subtract 97) . ord)
