module Codewars.Kata.Convert where

digitize :: Int -> [Int]
digitize 0 = [0]
digitize n = toDigits n

toDigits :: Int -> [Int]
toDigits 0 = []
toDigits n = n `rem` 10 : toDigits (n `div` 10)
