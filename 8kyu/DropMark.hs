module Kata where

remove :: String -> String
remove = reverse . drop' . reverse
 where
  drop' ('!' : xs) = xs
  drop' xs = xs
