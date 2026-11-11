module SplitAndAdd (splitAndAdd) where

splitAndAdd :: [Int] -> Int -> [Int]
splitAndAdd xs n
  | n == 0 = xs
  | otherwise = splitAndAdd (zipWith (+) l' r) (pred n)
 where
  size = length xs
  (l, r) = splitAt (size `div` 2) xs
  l' = if even size then l else 0 : l
