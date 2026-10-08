module Kata (remove) where

remove :: String -> String
remove s = l ++ r
 where
  l = filter (/= '!') s
  r = filter (== '!') s
