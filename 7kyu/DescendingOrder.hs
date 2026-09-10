module DescendingOrder where

import Data.List
import Data.Ord (Down (..))

descendingOrder :: Integer -> Integer
descendingOrder = read . sortOn Down . show
