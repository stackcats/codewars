module SimpleFibStrings where

solve :: Int -> String
solve 0 = "0"
solve 1 = "01"
solve n = fst $ foldl (\(a, b) _ -> (b, b ++ a)) ("0", "01") [1 .. n]
