module Kth where

import Prelude hiding ((!!))

elementAt :: [a] -> Int -> a
elementAt xs 1 = head xs
elementAt xs n = elementAt (tail xs) (pred n)
