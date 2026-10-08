module Amazon where

import Data.Bool
import Data.List

countArara :: Int -> String
countArara n = unwords $ replicate q "adak" ++ bool [] ["anane"] (r == 1)
 where
  (q, r) = quotRem n 2
