module Codewars.G964.HarmonPointTrip where

import Text.Printf (printf)

harmonPointTrip :: Float -> Float -> Float -> String
harmonPointTrip a b c = printf "%.2f" $ (a * c - 2 * a * b + c * b) / (2 * c - a - b)
