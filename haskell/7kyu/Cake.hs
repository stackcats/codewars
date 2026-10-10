module Cake where

import Data.Char

cake :: Int -> String -> String
cake n s = if fromIntegral m / fromIntegral n > 0.7 then "Fire!" else "That was close!"
 where
  m = sum . zipWith (\c f -> f c) s $ cycle [ord, (subtract 96) . ord]
