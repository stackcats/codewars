module LockerRun where

lockerRun :: Int -> [Int]
lockerRun n = takeWhile (<= n) [i ^ 2 | i <- [1 ..]]
