module ThueMorse (isThueMorse) where

import Data.Bool

isThueMorse :: [Int] -> Bool
isThueMorse xs = (xs ==) $ take size $ until ((>= size) . length) ((++) <$> id <*> f) [0]
 where
  f = map (bool 1 0 . (== 1))
  size = length xs
