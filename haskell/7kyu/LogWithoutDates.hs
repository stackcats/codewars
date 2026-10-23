module LogWithoutDates (checkLogs) where

import Data.List.Split

checkLogs :: [String] -> Int
checkLogs (a : b : xs)
  | a < b = checkLogs (b : xs)
  | otherwise = 1 + checkLogs (b : xs)
checkLogs [_] = 1
checkLogs [] = 0
