module TheLatestClock (latestClock) where

import Data.Function
import Data.List
import Data.Ord
import Text.Printf

latestClock :: Int -> Int -> Int -> Int -> String
latestClock a b c d =
  permutations [a, b, c, d]
    & map (\[a, b, c, d] -> (a * 10 + b, c * 10 + d))
    & filter (\(a, b) -> a <= 23 && b <= 59)
    & maximum
    & uncurry (printf "%02d:%02d")
