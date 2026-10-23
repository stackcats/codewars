module SF49 where

import Data.Char

decipher :: String -> String
decipher = go 0
 where
  go n [] = [chr n]
  go n (x : xs)
    | n < 97 || n > 122 = go (n * 10 + digitToInt x) xs
    | otherwise = (chr n) : go 0 (x : xs)
