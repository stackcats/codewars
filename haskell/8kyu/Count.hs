module Count (countChar) where

countChar :: String -> Char -> Int
countChar s c = length $ filter (== c) s
