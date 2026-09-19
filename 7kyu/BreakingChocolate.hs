module BreakingChocolate where

breakChocolate :: Int -> Int -> Int
breakChocolate n m = max 0 $ n * m - 1
