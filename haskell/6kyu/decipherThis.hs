module Kata (decipherThis) where

import Data.Char

decipherThis :: String -> String
decipherThis = unwords . map f . words
 where
  f s = case dropWhile isDigit s of
    [] -> [c]
    [x] -> [c, x]
    (x : xs) -> c : (last xs) : (init xs) ++ [x]
   where
    c = chr $ foldl1 (\acc x -> acc * 10 + x) $ map digitToInt $ takeWhile isDigit s
