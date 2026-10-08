module CodeWars.SmallestInteger where

findSmallestInteger :: [Int] -> Int
findSmallestInteger = foldl1 min
