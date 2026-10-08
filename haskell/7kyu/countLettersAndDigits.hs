module Kata where

import Data.Char

countLettersAndDigits :: String -> Int
countLettersAndDigits = length . filter isAlphaNum
