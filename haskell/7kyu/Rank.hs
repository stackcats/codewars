module Rank where

import Data.List
import Data.Maybe

rank :: (Ord a) => [a] -> [Double]
rank xs = mapMaybe (`lookup` mp) xs
 where
  mp = map rk . grp snd [] . zip [0 ..] $ sort xs

grp _ prev [] = [prev]
grp f [] (x : xs) = grp f [x] xs
grp f prev (x : xs)
  | f x == f (head prev) = grp f (x : prev) xs
  | otherwise = prev : grp f [x] xs

rk xs = (x, r)
 where
  x = snd $ head xs
  r = fromIntegral (sum $ map fst xs) / genericLength xs
