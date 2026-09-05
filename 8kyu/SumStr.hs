module Kata (sumStr) where

sumStr :: String -> String -> String
sumStr a b = show $ read' a + read' b
 where
  read' "" = 0
  read' s = read s
