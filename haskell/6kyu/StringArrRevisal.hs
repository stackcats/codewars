module StringArrRevisal where

import Data.List

dup :: [String] -> [String]
dup = map (map head . group)
