module Bus (enough) where

enough :: Int -> Int -> Int -> Int
enough cap on wait = max (wait - cap + on) 0
