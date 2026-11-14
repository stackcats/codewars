module ParseListFromString (parse) where

import Data.List.Split

parse :: String -> [Word]
parse = map read . init . splitOn " -> "
