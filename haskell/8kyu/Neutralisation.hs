module Neutralisation (neutralise) where

neutralise :: String -> String -> String
neutralise = zipWith (\a b -> if a == b then a else '0')
