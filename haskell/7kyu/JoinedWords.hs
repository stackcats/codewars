module JoinedWords where

joinS :: [[Char]] -> [Char] -> [Char]
joinS [] _ = []
joinS [x] _ = x
joinS (x : xs) s = x <> s <> foldr1 (\y acc -> y <> s <> acc) xs
