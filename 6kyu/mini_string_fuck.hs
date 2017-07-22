module MiniStringFuck where

import Data.Char

myFirstInterpreter :: String -> String
myFirstInterpreter code = f code 0
  where
    f "" _ = ""
    f ('+':xs) n = f xs ((n + 1) `mod` 256)
    f ('.':xs) n = chr n : f xs n
    f (_:xs) n = f xs n
