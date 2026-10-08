module WarnSheep (warnTheSheep) where

import Data.List

warnTheSheep :: [String] -> String
warnTheSheep xs =
  let ys = dropWhile (/= "wolf") xs
      n = length ys - 1
   in if n == 0
        then "Pls go away and stop eating my sheep"
        else "Oi! Sheep number " ++ show n ++ "! You are about to be eaten by a wolf!"
