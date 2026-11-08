module Codewars.G964.Salesmantravel where

import Data.List
import Data.List.Split

travel :: [Char] -> [Char] -> [Char]
travel _ "" = ":/"
travel r zipcode
  | xs == [] = zipcode <> ":/"
  | otherwise =
      let (x, y) = foldr1 (\(a, b) (c, d) -> (a <> "," <> c, b <> "," <> d)) xs
       in zipcode <> ":" <> y <> "/" <> x
 where
  xs = map f . filter (zipcode `isSuffixOf`) $ splitOn "," r
  f addr = (x, tail y')
   where
    (x, y) = break (== ' ') addr
    y' = take (length y - length zipcode - 1) y
