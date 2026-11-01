module Beets where

maxBeets :: Integer -> Integer -> Integer
maxBeets beets loss = x * (beets - y * loss)
 where
  x = max 1 $ (beets + loss) `div` (2 * loss)
  y = x - 1
