module Kata.StringAverage (averageString) where

import Data.List
import Data.Maybe

xs = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

averageString :: String -> String
averageString "" = "n/a"
averageString s
  | any (`notElem` xs) ws = "n/a"
  | otherwise = xs !! (sum ys `div` length ys)
 where
  ws = words s
  ys = map (\x -> fromJust $ findIndex (== x) xs) ws
