module Matryoshka where

import Data.List

matryoshka :: [[Int]] -> Bool
matryoshka = all f . (zip <*> drop 1) . sortOn head . map sort
 where
  f (xs, ys) = head xs < head ys && last xs > last ys
