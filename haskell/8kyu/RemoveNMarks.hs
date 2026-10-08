module Kata (remove) where

remove :: String -> Int -> String
remove "" _ = ""
remove s 0 = s
remove ('!' : s) n = remove s (n - 1)
remove (c : s) n = c : remove s n
