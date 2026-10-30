module Codewars.Kata.Employee where

off :: Integer -> [Integer]
off n = takeWhile (<= n) [i ^ 2 | i <- [1..]]
