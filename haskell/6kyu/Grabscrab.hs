module Grabscrab where

import Data.List

grabScrab :: String -> [String] -> [String]
grabScrab s = filter ((== t) . sort)
 where
  t = sort s
