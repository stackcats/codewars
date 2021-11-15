module Codewars.Kata.PowerOfTwo (powerOfTwo) where

import Prelude

powerOfTwo :: Int -> Boolean
powerOfTwo 0 = false
powerOfTwo 1 = true
powerOfTwo n = if n `mod` 2 == 0 then powerOfTwo $ n / 2 else false
