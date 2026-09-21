module Candles where

candles :: Int -> Int -> Int
candles candles makeNew = f 0 candles
 where
  f leftovers candles
    | candles > 0 = candles + f (leftovers + candles) 0
    | leftovers < makeNew = 0
    | otherwise = f (leftovers `mod` makeNew) (leftovers `div` makeNew)
