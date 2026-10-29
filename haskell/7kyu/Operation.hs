module Operation (result) where

result :: [[Int]] -> Int
result = product . map sum
