module Term where

nthterm :: Int -> Int -> Int -> Int
nthterm first n c = [first, first + c ..] !! n
