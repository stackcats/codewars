module LostNumber (findDeletedNumber) where

import Data.Function

findDeletedNumber :: [Int] -> [Int] -> Int
findDeletedNumber = (-) `on` sum
