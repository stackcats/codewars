module SF274 where

diplomas :: Int -> Int -> Int -> Int
diplomas h w n = until (\i -> (i `div` h) * (i `div` w) >= n) succ 0
