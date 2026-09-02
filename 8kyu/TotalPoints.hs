{-# LANGUAGE MultiWayIf #-}

module TotalPoints where

import Data.List.Split (splitOn)

points :: [String] -> Int
points = sum . map point

point :: String -> Int
point s =
  let [a, b] = splitOn ":" s
   in if
        | a > b -> 3
        | a == b -> 1
        | otherwise -> 0
