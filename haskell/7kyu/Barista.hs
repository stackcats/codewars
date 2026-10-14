module Barista (barista) where

import Data.List

barista :: [Int] -> Int
barista = sum . scanl1 (\a b -> a + b + 2) . sort
