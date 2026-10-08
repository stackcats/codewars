module Codewars.Palindromes where

nextPal :: Int -> Int
nextPal n = head $ dropWhile ((/=) <$> show <*> (reverse . show)) [n + 1 ..]
