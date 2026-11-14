module SimpleIndices where

solve :: String -> Int -> Maybe Int
solve str idx = go [] [0 ..] str
 where
  go _ _ [] = Nothing
  go st (i : is) (x : xs)
    | x == '(' = go (i : st) is xs
    | x /= ')' = go st is xs
    | head st == idx = Just i
    | otherwise = go (tail st) is xs
