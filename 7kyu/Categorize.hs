module Codewars.Kata.Categorize where

import Codewars.Kata.Categorize.Types

-- data Membership = Open | Senior deriving (Eq, Show)
openOrSenior :: [(Int, Int)] -> [Membership]
openOrSenior = map (\(age, handicap) -> if age >= 55 && handicap > 7 then Senior else Open)
