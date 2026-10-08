module Battle where

import Data.Char
import Data.Function

battle :: String -> String -> String
battle a b = case (compare `on` sum . map ord) a b of
  LT -> b
  GT -> a
  _ -> "Tie!"
