module Div where

import Data.Char

data Val c i = C c | I i deriving (Show)

divCon :: [Val Char Int] -> Int
divCon = foldl add 0
 where
  add n (C c) = n - digitToInt c
  add n (I i) = n + i
