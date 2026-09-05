module Kata where

remove :: String -> String
remove = (++ "!") . filter (/= '!')
