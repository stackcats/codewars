module Codewars.G964.Tortoise where

race :: Int -> Int -> Int -> Maybe (Int, Int, Int)
race v1 v2 g
  | v1 >= v2 = Nothing
  | otherwise = Just (h, m, s)
 where
  t :: Int
  t = floor $ fromIntegral g / fromIntegral (v2 - v1) * 3600
  h = t `div` 3600
  m = (t - h * 3600) `div` 60
  s = t `mod` 60
