module ChangeItUp (change) where

import Data.Char

change :: String -> String
change = map (f . toLower)

f c
  | not (isAlpha c) = c
  | d `elem` "aeiou" = toUpper d
  | otherwise = toLower d
 where
  d = if c == 'z' then 'a' else chr $ ord c + 1
