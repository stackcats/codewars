module Codewars.G964.FilterCoffee where

import Data.List

search :: Int -> [Int] -> String
search budget = intercalate "," . map show . sort . filter (<= budget)
