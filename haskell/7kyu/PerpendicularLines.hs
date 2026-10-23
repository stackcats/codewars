module PerpendicularLines (maxBisectors) where

maxBisectors :: Word -> Word
maxBisectors n = m * (n - m)
 where
  m = n `div` 2
