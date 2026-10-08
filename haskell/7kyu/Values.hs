module Values where

import Data.List

missingValues :: [Int] -> Int
missingValues xs = x * x * y
 where
  [[x], (y : _)] = sortOn length . filter ((< 3) . length) . group $ sort xs
