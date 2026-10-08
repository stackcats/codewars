module MissingNumber where

import Data.List
import Data.Maybe

missingNo :: [Int] -> Int
missingNo = fromMaybe 100 . fmap fst . find (uncurry (/=)) . zip [0 ..] . sort
