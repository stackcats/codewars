module LeastLarger (leastLarger) where

import Data.List
import Data.Ord

leastLarger :: [Int] -> Int -> Maybe Int
leastLarger xs i =
  case filter (\(n, i) -> n > t) $ zip xs [0 ..] of
    [] -> Nothing
    ys -> Just $ snd $ minimum ys
 where
  t = xs !! i
