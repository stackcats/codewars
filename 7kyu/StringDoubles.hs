module StringDoubles where

solve :: String -> String
solve = go []
 where
  go xs [] = reverse xs
  go [] (y : ys) = go [y] ys
  go (x : xs) (y : ys)
    | x == y = go xs ys
    | otherwise = go (y : x : xs) ys
