module Likes where

import Text.Printf

likes :: [String] -> String
likes [] = "no one likes this"
likes [a] = printf "%s likes this" a
likes [a, b] = printf "%s and %s like this" a b
likes [a, b, c] = printf "%s, %s and %s like this" a b c
likes (a : b : xs) = printf "%s, %s and %d others like this" a b $ length xs
