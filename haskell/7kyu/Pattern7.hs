module Pattern7 (pattern) where

pattern :: Int -> String
pattern n = unlines $ map (concatMap show) $ take n $ iterate rot [1 .. n]

rot s = drop 1 s ++ take 1 s
