module FindUnknownNumber where

findUnknown :: Int -> Int -> Int -> Int
findUnknown x y z = until (\n -> (== [x, y, z]) $ map (n `mod`) [3, 5, 7]) succ 1
