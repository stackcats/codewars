module ConsecutiveDifferences (differences) where

differences :: [Int] -> Int
differences [x] = x
differences xs = differences $ (zipWith ((abs .) . (-)) <*> drop 1) xs
