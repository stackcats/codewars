module Codewars.Kata.Caffeine where

caffeineBuzz :: Integer -> String
caffeineBuzz n
  | n `rem` 12 == 0 = "Coffee" ++ suf
  | n `rem` 3 == 0 = "Java" ++ suf
  | otherwise = "mocha_missing!"
 where
  suf = if even n then "Script" else ""
