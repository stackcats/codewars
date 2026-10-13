module SimpleMatches where

solve :: String -> String -> Bool
solve a b =
  if ('*' `elem` a)
    then match a b
    else a == b

match "*" _ = True
match [] _ = True
match _ [] = False
match (x : xs) (y : ys)
  | x == y = match xs ys
  | x == '*' = match (reverse xs) (reverse (y : ys))
  | otherwise = False
