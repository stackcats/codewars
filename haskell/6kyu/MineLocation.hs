module MineLocation where

import Data.Array
import Data.Maybe

mineLocation :: Array (Int, Int) Int -> Maybe (Int, Int)
mineLocation mat = listToMaybe [i | (i, v) <- assocs mat, v == 1]
