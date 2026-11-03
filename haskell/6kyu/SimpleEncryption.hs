module SimpleEncryption where

import Data.Char

encryptThis :: String -> String
encryptThis = unwords . map f . words
 where
  f [a] = show $ ord a
  f [a, b] = (show $ ord a) ++ [b]
  f (a : b : xs) = (show $ ord a) ++ (last xs : init xs) ++ [b]
