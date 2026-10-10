module NotAboveTheOne (binaryCleaner) where

import Data.List

binaryCleaner :: [Int] -> ([Int], [Int])
binaryCleaner xs = (map snd l, map fst r)
 where
  (l, r) = partition ((<= 1) . snd) $ zip [0 ..] xs
