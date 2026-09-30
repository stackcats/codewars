module LengthAndTwoValues (alternate) where

alternate :: Int -> a -> a -> [a]
alternate n a b = take n $ cycle [a, b]
