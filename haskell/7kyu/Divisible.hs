module Codewars.Kata.Divisible where

isDivisible :: (Integral n) => n -> [n] -> Bool
isDivisible n xs = all ((== 0) . (n `rem`)) xs
