module Mirror (mirror) where

import Data.List

mirror :: [Int] -> [Int]
mirror [] = []
mirror [x] = [x]
mirror xs = (lft ++) $ drop 1 $ reverse lft
 where
  lft = sort xs
