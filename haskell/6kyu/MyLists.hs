module Folded.MyLists where

foldList :: [Int] -> Int -> [Int]
foldList xs 0 = xs
foldList xs ct = foldList (zipWith (+) l' r') (ct - 1)
 where
  size = length xs
  (l, r) = splitAt (size `div` 2) xs
  l' = if odd size then l ++ [0] else l
  r' = reverse r
