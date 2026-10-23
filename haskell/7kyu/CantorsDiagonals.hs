module CantorsDiagonals (cantor) where

import Data.Bool

cantor :: [[Word]] -> [Word]
cantor = map (bool 0 1 . (== 0)) . zipWith (flip (!!)) [0 ..]
