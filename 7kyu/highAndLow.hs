module Kata (highAndLow) where

import Data.Function
import Text.Printf

highAndLow :: String -> String
highAndLow s =
  words s
    & map (\n -> read n :: Int)
    & foldl (\(a, b) n -> (max a n, min b n)) (minBound, maxBound)
    & uncurry (printf "%d %d")
