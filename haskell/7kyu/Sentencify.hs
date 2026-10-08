module Kata.Sentencify (sentencify) where

import Data.Char

sentencify :: [String] -> String
sentencify [] = ""
sentencify xs = let (y : ys) = unwords xs in [toUpper y] ++ ys ++ "."
