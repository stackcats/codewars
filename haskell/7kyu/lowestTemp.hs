module Kata (lowestTemp) where

lowestTemp :: String -> Maybe Int
lowestTemp s =
  case words s of
    [] -> Nothing
    xs -> Just $ minimum $ map read xs
