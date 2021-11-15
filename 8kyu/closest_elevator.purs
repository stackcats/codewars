module ClosestElevator (elevator) where

import Prelude
import Math (abs)
import Data.Int (toNumber)

elevator :: Int -> Int -> Int -> String
elevator l r c = if (abs $ toNumber $ r - c) <= (abs $ toNumber $ l - c)
                     then "right" 
                     else "left"
