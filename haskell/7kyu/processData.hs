module Kata (processData) where

processData :: [[Int]] -> Int
processData = product . map (\[a, b] -> a - b)
