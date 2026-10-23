module SF4 where

phoneCall :: Int -> Int -> Int -> Int -> Int
phoneCall min1 min2_10 min11 s
  | s >= min1 + min2_10 * 9 = (s - min1 - min2_10 * 9) `div` min11 + 10
  | s >= min1 = (s - min1) `div` min2_10 + 1
  | otherwise = 0
