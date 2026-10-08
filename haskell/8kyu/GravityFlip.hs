module GravityFlip (gravityFlip) where

import Data.List (sort, sortOn)
import Data.Ord (Down (..))

gravityFlip :: Char -> [Int] -> [Int]
gravityFlip 'R' = sort
gravityFlip 'L' = sortOn Down
