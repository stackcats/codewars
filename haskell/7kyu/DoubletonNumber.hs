module DoubletonNumber (doubleton) where

import Data.Set qualified as S

doubleton :: Int -> Int
doubleton = until ((== 2) . S.size . S.fromList . show) succ . succ
