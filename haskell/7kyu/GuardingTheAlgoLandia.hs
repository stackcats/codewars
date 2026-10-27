module GuardingTheAlgoLandia (findNeededGuards) where

findNeededGuards :: [Bool] -> Int
findNeededGuards [] = 0
findNeededGuards (x : xs) = go x xs
 where
  go _ [] = 0
  go prev (x : xs)
    | prev = go x xs
    | x = go x xs
    | otherwise = 1 + go True xs
