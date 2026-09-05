module Kata (replace) where

replace :: String -> String
replace = map (\c -> if c `elem` "aeiouAEIOU" then '!' else c)
