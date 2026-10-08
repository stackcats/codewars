module Stones (solution) where

import Data.List

solution :: String -> Int
solution = sum . map (pred . length) . group
