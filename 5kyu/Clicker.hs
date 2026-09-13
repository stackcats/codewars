module Clicker (clickerSolver) where

clickerSolver :: Int -> Int -> Int
clickerSolver _ 0 = 0
clickerSolver 0 _ = -1
clickerSolver up goal = go up
 where
  go cpc
    | cpc ^ 3 >= goal = clicks
    | otherwise = min (go (cpc + up) + cpc ^ 2 + 1) clicks
   where
    clicks = (goal + cpc - 1) `div` cpc
