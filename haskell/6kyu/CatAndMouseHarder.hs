module CatAndMouseHarder where

import Data.List
import Data.Maybe

catMouse :: String -> Int -> Either String String
catMouse s j
  | Nothing `elem` xs = Left "boring without all three"
  | abs (c - m) > j = Right "Escaped!"
  | d > c && d < m || d > m && d < c = Right "Protected!"
  | otherwise = Right "Caught!"
 where
  xs = map (\c -> findIndex (== c) s) "mDC"
  [m, d, c] = map fromJust xs
