module AllRationals where

allRationals :: [(Integer, Integer)]
allRationals = concat levels
 where
  levels = iterate (concatMap children) [(1, 1)]
  children (a, b) = [(a, a + b), (a + b, b)]
