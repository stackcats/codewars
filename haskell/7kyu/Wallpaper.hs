module Codewars.G964.Wallpaper where

numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]

wallpaper :: Double -> Double -> Double -> String
wallpaper l w h
  | l == 0 || w == 0 || h == 0 = "zero"
  | otherwise = (numbers !!) $ ceiling $ (l + w) * h * 2 * 1.15 / (0.52 * 10)
