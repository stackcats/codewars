module SlidingWindows (window) where

window :: Int -> Int -> [a] -> [[a]]
window len offset lst
  | len == 0 && null lst = [[]]
  | len > length lst = []
  | offset > length lst = [take len lst]
  | otherwise = (take len lst) : (window len offset $ drop offset lst)
