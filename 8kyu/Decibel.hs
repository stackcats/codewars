module Codewars.Kata.Decibel where

dBScale :: Double -> Double
dBScale i = (10 *) $ logBase 10 $ i / 10 ** (-12)
