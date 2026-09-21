module StatusArrays (status) where

import Data.List

status :: [Int] -> [Int]
status xs = map snd $ sortOn f $ zip [0 ..] xs
 where
  f (i, y) = (i +) $ length $ filter (< y) xs
