module Counter (ones) where

import Data.List

ones :: [Int] -> [Int]
ones = concatMap (\g -> if head g == 1 then [sum g] else []) . group
