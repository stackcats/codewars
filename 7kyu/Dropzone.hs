module Dropzone (dropzone) where

import Data.Function
import Data.List

dropzone :: [Int] -> [[Int]] -> [Int]
dropzone fire = minimumBy (compare `on` (dis fire))

dis [x1, y1] [x2, y2] = (x1 - x2) ^ 2 + (y1 - y2) ^ 2
