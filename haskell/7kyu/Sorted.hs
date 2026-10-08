module Sorted where

import Data.List
import Data.Ord (Down (..))

sortList :: (Ord b) => (a -> b) -> [a] -> [a]
sortList f = sortOn (Down . f)
