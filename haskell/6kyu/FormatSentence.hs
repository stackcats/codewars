module FormatSentence where

import Data.List

formatWords :: [String] -> String
formatWords = go . filter (/= "")

go [] = ""
go [x] = x
go [x, y] = x <> " and " <> y
go xs = (intercalate ", " $ init xs) <> " and " <> last xs
