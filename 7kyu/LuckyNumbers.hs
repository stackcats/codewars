module Haskell.Codewars.LuckyNumbers where

filterLucky :: [Int] -> [Int]
filterLucky = filter (('7' `elem`) . show)
