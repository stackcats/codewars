module Maskify where

maskify :: String -> String
maskify str
  | n <= 4 = str
  | otherwise =
      let (l, r) = splitAt (n - 4) str
       in replicate (length l) '#' ++ r
 where
  n = length str
