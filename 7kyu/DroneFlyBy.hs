module DroneFlyBy.Kata (flyBy) where

import Data.List

flyBy :: String -> String -> String
flyBy lamps drone = (replicate a 'o') ++ (replicate b 'x')
 where
  (Just i) = 'T' `elemIndex` drone
  n = length lamps
  a = min (i + 1) n
  b = n - a
