module StalinSort (stalinSort) where

stalinSort :: (Ord a) => [a] -> [a]
stalinSort arr = f arr []

f :: (Ord a) => [a] -> [a] -> [a]
f [] ys = reverse ys
f (x : xs) [] = f xs [x]
f (x : xs) ys
  | x >= head ys = f xs (x : ys)
  | otherwise = f xs ys
