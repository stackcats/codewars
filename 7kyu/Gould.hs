module Gould (gould) where

import Data.Bits

gould :: [Int]
gould = map popCount [0 :: Int ..]
