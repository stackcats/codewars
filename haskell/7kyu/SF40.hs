module SF40 where

import Control.Applicative
import Data.Char
import Data.List.Split

timedReading :: Int -> String -> Int
timedReading n = length . filter (liftA2 (&&) (<= n) (> 0) . length) . splitWhen (not . isAlpha)
