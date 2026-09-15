module Rot13 where

import Data.Char

rot13 :: String -> String
rot13 = map rot

rot :: Char -> Char
rot c
  | c `elem` (['a' .. 'z'] ++ ['A' .. 'Z']) =
      let a = if isUpper c then ord 'A' else ord 'a'
          byte = (ord c - a + 13) `rem` 26 + a
       in chr byte
  | otherwise = c
