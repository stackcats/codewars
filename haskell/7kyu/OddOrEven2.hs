module OddOrEven (oddOrEven) where

import Preloaded (Parity (..)) -- data Parity = EITHER | EVEN | ODD

oddOrEven :: Word -> Parity
oddOrEven n
  | odd n = EITHER
  | odd $ n `div` 2 = ODD
  | otherwise = EVEN
