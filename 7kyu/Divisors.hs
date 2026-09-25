module Divisors where

divisors :: (Show a, Integral a) => a -> Either String [a]
divisors a
  | xs == [] = Left $ (show a) ++ " is prime"
  | otherwise = Right xs
 where
  xs = [x | x <- [2 .. a - 1], a `rem` x == 0]
