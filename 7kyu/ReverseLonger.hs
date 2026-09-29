module ReverseLonger where

reverseLonger :: String -> String -> String
reverseLonger a b = s ++ (reverse l) ++ s
 where
  (s, l) = if length a < length b then (a, b) else (b, a)
