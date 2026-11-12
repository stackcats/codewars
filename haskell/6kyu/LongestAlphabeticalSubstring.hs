module LongestAlphabeticalSubstring (longest) where

longest :: String -> String
longest = go [] []

go ans curr [] = if length curr > length ans then (reverse curr) else ans
go ans [] (x : xs) = go ans [x] xs
go ans curr@(y : ys) (x : xs)
  | x >= y = go ans (x : curr) xs
  | length curr > length ans = go (reverse curr) [x] xs
  | otherwise = go ans [x] xs
