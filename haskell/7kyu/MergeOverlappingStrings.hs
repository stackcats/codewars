module MergeOverlappingStrings (merge) where

import Data.List

merge :: (Eq a) => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge xs ys = f xs (length ys) ys
 where
  f xs n ys
    | n == 0 = xs ++ ys
    | isSuffixOf (take n ys) xs = xs ++ (drop n ys)
    | otherwise = f xs (n - 1) ys
