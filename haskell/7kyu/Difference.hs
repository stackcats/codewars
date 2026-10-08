module Difference (diff) where

import Data.List

diff :: (Ord a) => [a] -> [a] -> [a]
diff a b = sort . nub $ (x \\ y) ++ (y \\ x)
 where
  x = nub a
  y = nub b
