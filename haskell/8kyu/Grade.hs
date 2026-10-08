module Codewars.Kata.Grade where

{- | Return a grade that fits the score

Keep in mind that a score above 1.0
counts as cheating and results in 'F'.
-}
grader :: Double -> Char
grader n
  | n > 1 = 'F'
  | n >= 0.9 = 'A'
  | n >= 0.8 = 'B'
  | n >= 0.7 = 'C'
  | n >= 0.6 = 'D'
  | otherwise = 'F'
