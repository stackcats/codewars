module EvenOdd where

import Data.Bool
import Data.Maybe
import Text.Read

solve :: [String] -> Int
solve = sum . map (bool 1 (-1) . odd) . mapMaybe readMaybe
