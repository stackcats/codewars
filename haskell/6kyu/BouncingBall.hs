module Codewars.Kata.BouncingBall where

bouncingBall :: Double -> Double -> Double -> Integer
bouncingBall h b w
  | h <= 0 = -1
  | b <= 0 || b >= 1 = -1
  | w >= h = -1
  | otherwise = go h
 where
  go h
    | nh > w = 2 + go nh
    | h > w = 1 + go nh
    | otherwise = 0
   where
    nh = h * b
