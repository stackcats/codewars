module Tipper where

calcTip :: Int -> Int -> Int
calcTip p r =
  case r of
    1 -> t + 1
    0 -> max (t - 1) 0
    -1 -> max (t `div` 2 - 1) 0
 where
  m = p `mod` 10
  p' = if m < 5 then p - m else p + 10 - m
  t = p' `div` 10
