module Pandemia (infected) where

import Data.Bool
import Data.List
import Data.List.Split

infected :: String -> Double
infected = (* 100) . (\(a, b) -> bool (a / b) 0 (b == 0)) . foldl f (0, 0) . splitOn "X"
 where
  f (infected, total) xs
    | '1' `elem` xs = (infected + size, total + size)
    | otherwise = (infected, total + size)
   where
    size = genericLength xs
