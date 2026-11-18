module CountRepeats where

import Data.List

countRepeats :: String -> Int
countRepeats = sum . map (pred . length) . group
