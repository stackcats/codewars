module PerniciousNumbers where

import Data.Bits

class PerniciousNumbers a where
  pernicious :: a -> Either String [Int]

instance PerniciousNumbers Int where
  pernicious n = intPernicious n

instance PerniciousNumbers Float where
  pernicious f = intPernicious $ floor f -- this is broken, fix it

intPernicious :: Int -> Either String [Int]
intPernicious n =
  case filter (isPrime . popCount) [3 .. n] of
    [] -> Left "No pernicious numbers"
    xs -> Right xs

isPrime n
  | n < 2 = False
  | n == 2 = True
  | otherwise = all ((/= 0) . (n `mod`)) [2 .. limit]
 where
  limit = ceiling $ sqrt $ fromIntegral n
