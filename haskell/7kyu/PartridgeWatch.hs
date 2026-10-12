module Codewars.AlanPartridge.PartridgeWatch where

items =
  [ "Partridge"
  , "PearTree"
  , "Chat"
  , "Dan"
  , "Toblerone"
  , "Lynn"
  , "AlphaPapa"
  , "Nomad"
  ]

part :: [String] -> String
part xs
  | n == 0 = "Lynn, I've pierced my foot on a spike!!"
  | otherwise = "Mine's a Pint" ++ replicate n '!'
 where
  n = length $ filter (`elem` items) xs
