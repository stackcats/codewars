module SwapHeadTail (swapHeadAndTail) where

swapHeadAndTail :: [a] -> [a]
swapHeadAndTail xs
  | even $ length xs = rst ++ l
  | otherwise = r ++ [m] ++ l
 where
  (l, rst) = splitAt (length xs `div` 2) xs
  (m : r) = rst
