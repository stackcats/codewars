module FindAllOccurences (findAll) where

findAll :: [Int] -> Int -> [Int]
findAll xs n = map fst . filter ((== n) . snd) $ zip [0 ..] xs
