module WhoIsPaying where

whoIsPaying :: String -> [String]
whoIsPaying n
  | length n <= 2 = [n]
  | otherwise = [n, (take 2 n)]
