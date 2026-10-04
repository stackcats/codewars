module Kata where

createArrayOfTiers :: Int -> [String]
createArrayOfTiers 0 = ["0"]
createArrayOfTiers n = reverse . map show $ takeWhile (> 0) $ iterate (`div` 10) n
