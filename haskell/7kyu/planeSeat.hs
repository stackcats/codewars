module Kata (planeSeat) where

import Data.Char
import Data.List

planeSeat :: String -> String
planeSeat s
  | r' `elem` "IJ" || l' > 60 || r' > 'K' = "No Seat!!"
  | otherwise = f l' ++ "-" ++ g r'
 where
  (l, r) = partition isDigit s
  l' = read l
  r' = head r

  f n
    | n <= 20 = "Front"
    | n <= 40 = "Middle"
    | otherwise = "Back"

  g n
    | n <= 'C' = "Left"
    | n <= 'F' = "Middle"
    | otherwise = "Right"
