module Solution where

import Data.List

revSub :: [Integer] -> [Integer]
revSub xs = concatMap (\s -> if even (head s) then reverse s else s) $ groupBy (\a b -> even a == even b) xs
