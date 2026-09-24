module Codewars.Kata.Distance where

import Data.List

distancesFromAverage :: [Double] -> [Double]
distancesFromAverage xs = map (`subtract` avg) xs
 where
  avg = sum xs / genericLength xs
