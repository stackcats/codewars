module Codewars.Kata.Bookseller where

import Codewars.Kata.Bookseller.Types

import Data.List
import Data.Maybe

-- data Stock    = Stock String Int deriving (Show, Eq)
stocklist :: [Stock] -> [Char] -> [(Char, Int)]
stocklist [] _ = []
stocklist st cs = map (\x -> (x, fromMaybe 0 $ lookup x ys)) cs
 where
  f (Stock s n) = (head s, n)
  g xs = (fst $ head xs, sum $ map snd xs)
  ys = map g . groupBy (\a b -> fst a == fst b) . sortOn fst $ map f st
