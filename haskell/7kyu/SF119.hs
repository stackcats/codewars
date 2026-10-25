module SF119 where

passTheBill :: Int -> Int -> Int -> Int
passTheBill total con ref
  | con >= target = 0
  | target - con > ind = -1
  | otherwise = target - con
 where
  ind = total - con - ref
  target = max (ref + 1) $ total `div` 2 + 1
