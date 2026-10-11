module DuplicateSandwich (duplicateSandwich) where

duplicateSandwich :: (Eq a) => [a] -> [a]
duplicateSandwich (x : xs)
  | x `elem` xs = takeWhile (/= x) xs
  | otherwise = duplicateSandwich xs
