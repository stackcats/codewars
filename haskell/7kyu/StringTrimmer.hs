module Codewars.StringTrimmer where

trim :: String -> Int -> String
trim str n
  | size <= n = str
  | size <= 3 = take n str ++ "..."
  | otherwise = take (n - 3) str ++ "..."
 where
  size = length str
