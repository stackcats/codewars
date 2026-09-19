module SF87 where

import Data.List

shuffledList :: [Int] -> [Int]
shuffledList xs = let t = sum xs `div` 2 in sort $ delete t xs
