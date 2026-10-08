module Kata.OddOrEven where

import Data.Bool

oddOrEven :: (Integral a) => [a] -> String
oddOrEven = bool "odd" "even" . even . sum
