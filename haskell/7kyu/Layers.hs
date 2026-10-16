module Layers where

import Data.List

layers :: Int -> Int
layers n =
  let x = ceiling $ sqrt $ fromIntegral n
      y = if even x then x + 1 else x
   in (y - 1) `div` 2 + 1
