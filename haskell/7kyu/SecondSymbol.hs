module SecondSymbol (secondSymbol) where

import Data.List

secondSymbol :: String -> Char -> Int
secondSymbol s c =
  case findIndices (== c) s of
    _ : b : _ -> b
    _ -> -1
