module FractranInterpreter (fractran) where

import Data.List.Split

fractran :: String -> Integer -> Integer
fractran code n = go n fs 1000
 where
  fs = map (map read . splitOn "/") $ words code
  go n _ 0 = n
  go n [] _ = n
  go n ([a, b] : xs) ct
    | n * a `mod` b == 0 = go (n * a `div` b) fs (ct - 1)
    | otherwise = go n xs ct
