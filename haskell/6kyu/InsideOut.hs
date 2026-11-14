module InsideOut where

insideOut :: String -> String
insideOut = unwords . map f . words

f s
  | size < 4 = s
  | even size = reverse l <> reverse r
  | otherwise = reverse l <> [head r] <> reverse (tail r)
 where
  size = length s
  (l, r) = splitAt (size `div` 2) s
