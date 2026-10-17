module SetReducer (setReducer) where

import Data.List

setReducer :: [Int] -> Int
setReducer [x] = x
setReducer xs = setReducer $ map length $ group xs
