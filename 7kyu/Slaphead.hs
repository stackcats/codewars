module Slaphead where

bald :: String -> (String, String)
bald s
  | size == 0 = (t, "Clean!")
  | size == 1 = (t, "Unicorn!")
  | size == 2 = (t, "Homer!")
  | size >= 3 && size <= 5 = (t, "Careless!")
  | otherwise = (t, "Hobo!")
 where
  t = map (const '-') s
  size = length $ filter (== '/') s
