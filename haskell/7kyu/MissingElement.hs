module MissingElement where

getMissingElement :: [Int] -> Int
getMissingElement = (45 -) . sum
