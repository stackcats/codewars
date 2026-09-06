module SquareDigit (squareDigit) where

import Data.Char

squareDigit :: Integer -> Integer
squareDigit = read . concatMap (\c -> show $ digitToInt c ^ 2) . show
