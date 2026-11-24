module Cats (peacefulYard) where

peacefulYard :: [String] -> Int -> Bool
peacefulYard yard minDistance = all (>= (fromIntegral minDistance)) [dis a b | a <- cats, b <- cats, a /= b]
 where
  cats = [(i, j) | (i, row) <- zip [0 ..] yard, (j, c) <- zip [0 ..] row, c /= '-']

dis (a, b) (c, d) =
  sqrt $ (a - c) ^ 2 + (b - d) ^ 2
