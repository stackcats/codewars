module Codewars.Kata.Phone where

import Text.Regex.TDFA

validPhoneNumber :: String -> Bool
validPhoneNumber = (=~ "^\\([0-9]{3}\\) [0-9]{3}\\-[0-9]{4}$")
