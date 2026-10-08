module RationalSearch where

import Data.Ratio

findR :: Rational -> Rational -> Rational
findR p q =
  head
    [ r
    | d <- [1 ..]
    , n <- [floor (p * fromIntegral d) + 1 .. ceiling (q * fromIntegral d) - 1]
    , let r = n % d
    , p < r
    , r < q
    ]
