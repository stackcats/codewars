module Hanoi (hanoi) where

hanoi :: Int -> Integer
hanoi = pred . (2 ^) . fromIntegral
