module Coprime (coprime) where

coprime :: Word -> Word -> Bool
coprime = ((== 1) .) . gcd
