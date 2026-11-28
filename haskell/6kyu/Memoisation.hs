module Memoisation (memo) where

memo :: (Enum a) => (a -> b) -> (a -> b)
memo fn = (map (fn . toEnum) [0 ..] !!) . fromEnum
