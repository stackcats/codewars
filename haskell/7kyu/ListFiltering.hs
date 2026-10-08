module ListFiltering (filterList) where

import Data.Either

filterList :: [Either String Int] -> [Int]
filterList = rights
