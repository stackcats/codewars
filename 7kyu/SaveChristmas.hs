module SaveChristmas (determineTime) where

import Data.List.Split

determineTime :: [String] -> Bool
determineTime = (<= 24 * 3600) . sum . map (seconds . (map read) . (splitOn ":"))

seconds [h, m, s] = h * 3600 + m * 60 + s
