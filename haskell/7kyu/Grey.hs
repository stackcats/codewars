module Codewars.Kata.Grey where

import Text.Printf

shadesOfGrey :: Int -> [String]
shadesOfGrey = map grey . enumFromTo 1 . min 254

grey n = printf "#%02x%02x%02x" n n n
