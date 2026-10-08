module Remove where

remove :: [Int] -> [Int] -> [Int]
remove xs ys = filter (not . (`elem` ys)) xs
