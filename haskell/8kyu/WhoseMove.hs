module Kata.WhoseMove (whoseMove) where

whoseMove :: String -> Bool -> String
whoseMove lastPlayer True = lastPlayer
whoseMove lastPlayer _ = change lastPlayer

change "white" = "black"
change "black" = "white"
