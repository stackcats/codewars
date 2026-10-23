module NoisyCellCounts (cleanedCounts) where

cleanedCounts :: [Word] -> [Word]
cleanedCounts (a : b : xs) = let x = max a b in a : cleanedCounts (x : xs)
cleanedCounts xs = xs
