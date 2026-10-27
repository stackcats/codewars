module ConstructSubmatrix (constructSubmatrix) where

constructSubmatrix :: [[a]] -> [Int] -> [Int] -> [[a]]
constructSubmatrix mat rs cs = map (del cs) $ del rs mat

del xs = map snd . filter ((`notElem` xs) . fst) . zip [0 ..]
