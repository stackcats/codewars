module SF42 where

areSimilar :: [Int] -> [Int] -> Bool
areSimilar xs ys =
  case filter (\(a, b) -> a /= b) $ zip xs ys of
    [] -> True
    [(a, b), (c, d)] -> a == d && b == c
    _ -> False
