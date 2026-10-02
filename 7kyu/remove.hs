module Kata (remove) where

remove :: String -> String
remove = unwords . filter ((/= 1) . count '!') . words
 where
  count c = length . filter (== c)
