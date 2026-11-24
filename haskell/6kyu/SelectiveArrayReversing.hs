module SelectiveArrayReversing (selReverse) where

import Data.List.Split

selReverse :: Int -> [a] -> [a]
selReverse = (.) (concat . map reverse) . chunksOf
