module FreqSort where

import Data.List
import Data.Ord

solve :: [Int] -> [Int]
solve = concat . sortBy (comparing (Down . length) <> comparing head) . group . sort
