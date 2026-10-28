module TableGame where

tableGame :: [[Int]] -> Maybe [Int]
tableGame [[a, b, c], [d, e, f], [g, h, i]]
  | all id [a + c == b, a + g == d, c + i == f, g + i == h, a + c + g + i == e] = Just [a, c, g, i]
  | otherwise = Nothing
