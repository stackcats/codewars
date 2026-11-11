module Kata where

import Data.Function
import Data.List

sortTwisted37 :: [Int] -> [Int]
sortTwisted37 = sortBy (compare `on` ((read :: String -> Int) . map twist . show))

twist c = case c of
  '7' -> '3'
  '3' -> '7'
  _ -> c
