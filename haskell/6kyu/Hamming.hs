module Hamming (decode, encode) where

import Data.Char
import Data.List.Split
import Text.Printf

decode, encode :: [Char] -> [Char]
encode = concatMap (concatMap (replicate 3) . bits . ord)

bits :: Int -> String
bits = printf "%08b"

decode = map (chr . foldl1 (\acc x -> acc * 2 + x)) . chunksOf 8 . map f . chunksOf 3

f xs
  | a > 1 = 1
  | otherwise = 0
 where
  a = length $ filter (== '1') xs
