module NegativeZero where

negativeZero :: Float -> Bool
negativeZero x = x == 0 && isInfinite (1 / x) && 1 / x < 0
