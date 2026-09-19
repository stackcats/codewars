module Codewars.G964.Gps1 where

gps :: Int -> [Double] -> Int
gps _ [] = 0
gps _ [_] = 0
gps s x = floor $ maximum $ map (\(a, b) -> (b - a) * 3600 / (fromIntegral s)) $ zip x (drop 1 x)
