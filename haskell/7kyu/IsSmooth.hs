module IsSmooth where

isSmooth :: [Int] -> Bool
isSmooth xs = head xs == mid && mid == last xs
 where
  (l, r) = splitAt (length xs `div` 2) xs
  mid = if even $ length xs then last l + head r else head r
