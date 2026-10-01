module SubstringCount (solution) where

solution :: String -> String -> Int
solution haystack needle
  | h < n = 0
  | take n haystack == needle = 1 + solution (drop n haystack) needle
  | otherwise = solution (drop 1 haystack) needle
 where
  h = length haystack
  n = length needle
