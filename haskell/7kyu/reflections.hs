module Kata where

reflections :: Int -> Int -> Bool
reflections x y =
  let l = lcm x y
   in odd (l `div` x) == odd (l `div` y)
