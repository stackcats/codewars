module LondonCityHacker (londonCityHacker) where

import Text.Printf

import LondonCityHacker.Preloaded (Journey (..)) -- data Journey = Bus Int | Tube String deriving (Show,Eq)

londonCityHacker :: [Journey] -> String
londonCityHacker = printf "£%.2g" . go
 where
  go :: [Journey] -> Double
  go [] = 0
  go (x : y : xs) =
    case (x, y) of
      (Bus _, Bus _) -> 1.5 + go xs
      (Bus _, _) -> 1.5 + go (y : xs)
      (Tube _, _) -> 2.4 + go (y : xs)
  go [Bus _] = 1.5
  go [Tube _] = 2.4
