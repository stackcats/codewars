module Count where

countZeros :: Int -> Int
countZeros = sum . map (length . filter (== '0') . show) . enumFromTo 10
