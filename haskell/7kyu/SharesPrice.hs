module Codewars.G964.SharesPrice where

import Text.Printf

sharePrice :: Double -> [Double] -> String
sharePrice = (printf "%.2f" .) . foldl (\acc c -> acc * (1 + c / 100))
