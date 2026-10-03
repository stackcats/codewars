module Codewars.Kata.VampireNumbers where

import Data.List

isVampire :: Integer -> Integer -> Bool
isVampire a b = sort x == sort y
 where
  x = show a ++ show b
  y = show $ a * b
