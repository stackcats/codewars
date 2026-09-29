module ElevatorDistance (elevatorDistance) where

elevatorDistance :: [Int] -> Int
elevatorDistance xs = sum $ zipWith ((abs .) . (-)) xs $ drop 1 xs
