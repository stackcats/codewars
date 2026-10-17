module Kata where

findMissingLetter :: [Char] -> Char
findMissingLetter (a : b : xs)
  | succ a /= b = succ a
  | otherwise = findMissingLetter (b : xs)
