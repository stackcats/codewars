module CodeWars.Kata.GreetMe where

import Data.Char
import Text.Printf

greet :: String -> String
greet name = printf "Hello %c%s!" (toUpper s) (map toLower ss)
 where
  (s : ss) = name
