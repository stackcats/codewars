module Dictionaries where

import Data.List
import Data.Ord

sortDict :: (Ord v) => [(k, v)] -> [(k, v)]
sortDict = sortOn (Down . snd)
