module Queue where

queue :: [Int] -> Int -> Int
queue xs i = go 1 $ zip xs [0 ..]
 where
  go ct ((n, j) : xs)
    | n == 1 && j == i = ct
    | n == 1 = go (succ ct) xs
    | otherwise = go (succ ct) (xs ++ [(n - 1, j)])
