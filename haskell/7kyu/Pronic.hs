module Codewars.Exercise.Pronic where

isPronic :: Integer -> Bool
isPronic k
  | k < 0 = False
  | otherwise = let n = floor $ sqrt $ fromIntegral k in n * (succ n) == k
