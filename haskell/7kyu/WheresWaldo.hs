module WheresWaldo where

import Data.List

findWaldo :: [String] -> (Int, Int)
findWaldo crowd = head [(i, j) | (i, r) <- zip [0 ..] crowd, (j, c) <- zip [0 ..] r, c == w]
 where
  w = head . head . filter ((== 1) . length) . group . sort $ concat crowd
