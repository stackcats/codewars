module Codewars.AlanPartridge.London where

mentions =
  [ "Rejection"
  , "Disappointment"
  , "Backstabbing Central"
  , "Shattered Dreams Parkway"
  ]

alan :: [String] -> String
alan xs =
  if all (`elem` xs) mentions
    then "Smell my cheese you mother!"
    else "No, seriously, run. You will miss it."
