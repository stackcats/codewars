module Binaries (code, decode) where

import Data.Char
import Text.Printf

code :: String -> String
code = concatMap f
 where
  f c = reverse ("1" <> replicate (length b - 1) '0') <> b
   where
    b = printf "%b" $ digitToInt c

decode :: String -> String
decode "" = ""
decode s = (show n) <> decode (drop (k * 2) s)
 where
  (l, r) = break (== '1') s
  k = length l + 1
  b = take k $ drop 1 r
  n = foldl (\acc x -> acc * 2 + digitToInt x) 0 b
