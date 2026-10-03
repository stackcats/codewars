module Codewars.G964.Funreverse where

reverseFun :: String -> String
reverseFun [x] = [x]
reverseFun xs = let (a : b) = reverse xs in a : reverseFun b
